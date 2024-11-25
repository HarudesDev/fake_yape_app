import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  static final transactions = <Map<String, String>>[
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: mainColor,
        title: const Text(
          "Movimientos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(
            Icons.email_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.tune,
            color: Colors.white,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          MonthTransactions(
            transactions: transactions,
            month: "Octubre 2024",
            first: true,
          ),
          MonthTransactions(
            transactions: transactions,
            month: "Setiembre 2024",
            first: false,
          ),
          MonthTransactions(
            transactions: transactions,
            first: false,
            month: "Agosto 2024",
          ),
        ],
      ),
    );
  }
}

class MonthTransactions extends StatelessWidget {
  const MonthTransactions({
    super.key,
    required this.transactions,
    required this.month,
    required this.first,
  });

  final List<Map<String, String>> transactions;

  final String month;

  final bool first;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        !first ? const Divider() : const SizedBox(),
        SliverPinnedHeader(
          child: ColoredBox(
            color: Colors.white,
            child: ListTile(
              title: Text(
                month,
                style: const TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
          sliver: SliverList.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TransactionTile(transaction: transactions[index]),
                  index != transactions.length - 1
                      ? const Divider()
                      : const SizedBox(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Map<String, String> transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction['receiverName']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Gap(10),
              Text(
                transaction['date']!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            transaction['amount']!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
