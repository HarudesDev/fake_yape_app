import 'dart:developer';

import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/shared/providers/yapeos_provider.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'transactions_components.dart';

@RoutePage()
class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  DateTime dateFilter = DateTime.now()
      .subtract(const Duration(days: 7))
      .copyWith(hour: 0, minute: 0, second: 0);

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text("Selecciona un filtro"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              _changeDateFilter(0);
              Navigator.pop(context);
            },
            child: const Text("Solo hoy"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _changeDateFilter(7);
              Navigator.pop(context);
            },
            child: const Text("Últimos 7 días"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _changeDateFilter(15);
              Navigator.pop(context);
            },
            child: const Text("Últimos 15 días"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _changeDateFilter(30);
              Navigator.pop(context);
            },
            child: const Text("Últimos 30 días"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _changeDateFilter(90);
              Navigator.pop(context);
            },
            child: const Text("Últimos 90 días"),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            log('cerrando');
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
      ),
    );
  }

  void _changeDateFilter(int lastDays) {
    final actualDate = DateTime.now();
    final startDate = actualDate.subtract(Duration(days: lastDays));
    dateFilter = DateTime(startDate.year, startDate.month, startDate.day)
        .copyWith(hour: 0, minute: 0, second: 0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final yapeos = ref.watch(
      userLastYapeosFromDateProvider(dateFilter),
    );
    final user = ref.read(supabaseAuthRepositoryProvider).getUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          "Movimientos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              color: Colors.white,
            ),
            onPressed: () => _showActionSheet(context),
          ),
        ],
      ),
      body: yapeos.when(
        data: (yapeos) {
          return CustomScrollView(
            slivers: yapeos.map((yapeoMonth) {
              final yapeos = yapeoMonth['yapeos'] as List<Yapeo>;
              return MonthTransactions(
                yapeos: yapeos,
                month: yapeoMonth['month'],
                first: true,
                userName: user!.userMetadata!['fullName'],
              );
            }).toList(),
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
