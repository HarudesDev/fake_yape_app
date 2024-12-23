import 'dart:developer';

import 'package:fake_yape_app/yape/models/user.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

class SupabaseDatabaseRepository {
  final SupabaseClient _supabase;

  SupabaseDatabaseRepository(this._supabase);

  Future<List<Map<String, dynamic>>> getLastYapeosFromDate(
      int userId, DateTime startDate) async {
    final query = await _supabase
        .from('yapeos')
        .select('id, yapeo_amount, yapeo_date, message,'
            'sender:sender_id(fullname, phone_number),'
            ' receiver:receiver_id(fullname, phone_number)')
        .or('receiver_id.eq.${userId.toString()}, sender_id.eq.${userId.toString()}')
        .gte('yapeo_date', startDate)
        .order('yapeo_date');
    final yapeos = query.map((yapeo) {
      final formattedYapeo = {
        ...yapeo,
        'sender_name': yapeo['sender']['fullname'],
        'receiver_name': yapeo['receiver']['fullname'],
        'sender_phone': yapeo['sender']['phone_number'],
        'receiver_phone': yapeo['receiver']['phone_number'],
      };
      return Yapeo.fromJson(formattedYapeo);
    }).toList();
    List<Map<String, dynamic>> yapeosByMonth = [];
    for (var yapeo in yapeos) {
      final yapeoMonth = DateFormat.MMMM().format(yapeo.yapeoDate);
      final monthIndex =
          yapeosByMonth.indexWhere((element) => element['month'] == yapeoMonth);
      if (monthIndex >= 0) {
        yapeosByMonth[monthIndex]['yapeos'].add(yapeo);
      } else {
        yapeosByMonth.add({
          'month': yapeoMonth,
          'yapeos': [yapeo],
        });
      }
    }
    return yapeosByMonth;
  }

  Future<List<Yapeo>> getLastYapeos(int userId) async {
    final query = await _supabase
        .from('yapeos')
        .select('id, yapeo_amount, yapeo_date, message,'
            'sender:sender_id(fullname, phone_number),'
            ' receiver:receiver_id(fullname, phone_number)')
        .or('receiver_id.eq.${userId.toString()}, sender_id.eq.${userId.toString()}')
        .order('yapeo_date')
        .limit(7);
    return query.map((yapeo) {
      final formattedYapeo = {
        ...yapeo,
        'sender_name': yapeo['sender']['fullname'],
        'receiver_name': yapeo['receiver']['fullname'],
        'sender_phone': yapeo['sender']['phone_number'],
        'receiver_phone': yapeo['receiver']['phone_number'],
      };
      return Yapeo.fromJson(formattedYapeo);
    }).toList();
  }

  Future<Yapeo?> getYapeoById(int yapeoId) async {
    final query = await _supabase
        .from('yapeos')
        .select('id, yapeo_amount, yapeo_date, '
            'sender:sender_id(fullname, phone_number),'
            ' receiver:receiver_id(fullname, phone_number)')
        .eq('id', yapeoId);
    final yapeo = query[0];
    return query.isNotEmpty
        ? Yapeo.fromJson({
            ...yapeo,
            'sender_name': yapeo['sender']['fullname'],
            'receiver_name': yapeo['receiver']['fullname'],
            'sender_phone': yapeo['sender']['phone_number'],
            'receiver_phone': yapeo['receiver']['phone_number'],
          })
        : null;
  }

  Future<MyUser?> getUserByPhone(String phoneNumber) async {
    final query = await _supabase
        .from('users')
        .select('id, fullname, phone_number')
        .eq('phone_number', phoneNumber);
    final user = query.isNotEmpty ? MyUser.fromJson(query[0]) : null;
    return user;
  }

  Future<MyUser?> getUserByAuthId(String authId) async {
    final query = await _supabase
        .from('users')
        .select('id,fullname,phone_number')
        .filter('auth_service_id', 'eq', authId);
    return query.isNotEmpty ? MyUser.fromJson(query[0]) : null;
  }

  Future<MyUser?> getUserById(int id) async {
    final query = await _supabase
        .from('users')
        .select('id,fullname,phone_number')
        .filter('id', 'eq', id);
    return query.isNotEmpty ? MyUser.fromJson(query[0]) : null;
  }

  Future<double?> getUserBalanceByAuthId(String authId) async {
    final query = await _supabase
        .from('users')
        .select('account_balance')
        .filter('auth_service_id', 'eq', authId);
    return query.isNotEmpty ? query[0]['account_balance'] : null;
  }

  Future<Yapeo?> doYapeo(
      int senderId, int receiverId, double yapeoAmount, String? message) async {
    final query = await _supabase
        .from('users')
        .select('id, account_balance')
        .filter('id', 'eq', senderId);
    if (query.isNotEmpty && query[0]['account_balance'] >= yapeoAmount) {
      log('starting yapeo');
      try {
        final yapeo = await _supabase.rpc(
          'create_yapeo',
          params: {
            'p_sender_id': senderId,
            'p_receiver_id': receiverId,
            'p_yapeo_amount': yapeoAmount,
            'p_message': message,
          },
        );
        final yapeoData = await getYapeoById(yapeo['id']);
        return yapeoData;
      } catch (e) {
        rethrow;
      }
    } else {
      return null;
    }
  }
}

final supabaseClientProvider =
    Provider<SupabaseClient>((ref) => Supabase.instance.client);

final supabaseDatabaseRepositoryProvider = Provider<SupabaseDatabaseRepository>(
  (ref) => SupabaseDatabaseRepository(ref.read(supabaseClientProvider)),
);
