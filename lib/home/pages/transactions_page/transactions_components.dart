import 'package:fake_yape_app/home/pages/home_page/home_components.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:fake_yape_app/shared/style.dart';

class MonthTransactions extends StatelessWidget {
  const MonthTransactions({
    super.key,
    required this.yapeos,
    required this.month,
    required this.first,
    required this.userName,
  });

  final List<Yapeo> yapeos;

  final String month;

  final bool first;

  final String userName;

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
            itemCount: yapeos.length,
            itemBuilder: (context, index) {
              final yapeo = yapeos[index];
              return Column(
                children: [
                  TransactionTile(
                    yapeo: yapeo,
                    isReceiver: yapeo.receiverName == userName,
                  ),
                  index != yapeos.length - 1
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
