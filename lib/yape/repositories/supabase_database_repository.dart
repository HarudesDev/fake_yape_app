import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseRepository {
  final SupabaseClient _supabase;

  SupabaseDatabaseRepository(this._supabase);

  Future<List<Map<String, dynamic>>> getLastYapeos(int id) async {
    final query = await _supabase
        .from('yapeos')
        .select('id, yapeo_amount, yapeo_date, '
            'from:sender_id(fullname), to:receiver_id(fullname)')
        .or('receiver_id.eq.${id.toString()}, sender_id.eq.${id.toString()}')
        .order('yapeo_date')
        .limit(7);
    return query.toList();
  }
}

final supabaseClientProvider =
    Provider<SupabaseClient>((ref) => Supabase.instance.client);

final supabaseDatabaseRepositoryProvider = Provider<SupabaseDatabaseRepository>(
  (ref) => SupabaseDatabaseRepository(ref.read(supabaseClientProvider)),
);
