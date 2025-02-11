import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/providers/yapeos_provider.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'home_page_controller.dart';

const hiddenBalanceString = "";

class TransactionsList extends ConsumerStatefulWidget {
  const TransactionsList({
    super.key,
  });
  @override
  ConsumerState<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends ConsumerState<TransactionsList> {
  bool showBalance = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<double?>>(
      homePageControllerProvider,
      (value, state) => state.whenOrNull(
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.toString()),
          ));
        },
        data: (data) {},
      ),
    );

    final yapeoList = ref.watch(userLastYapeosProvider);
    final user = ref.read(supabaseAuthRepositoryProvider).getUser;
    final state = ref.watch(homePageControllerProvider);
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(minHeight: 500),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                alignment: const AlignmentDirectional(-1, 0),
                elevation: const WidgetStatePropertyAll<double>(3),
                shape: getRoundedRectangleBorder(10.0),
              ),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    showBalance ? "Ocultar saldo" : "Mostrar saldo",
                    style: const TextStyle(color: mainColor),
                  ),
                  state.when(
                      data: (data) => Text(
                            showBalance
                                ? data != null
                                    ? "S/ ${data.toString()}"
                                    : hiddenBalanceString
                                : hiddenBalanceString,
                            style: const TextStyle(color: mainColor),
                          ),
                      error: (error, stack) => const Text(hiddenBalanceString),
                      loading: () => const CircularProgressIndicator()),
                ],
              ),
              icon: Icon(
                showBalance ? Icons.visibility_off : Icons.visibility,
                color: mainColor,
              ),
              onPressed: () {
                if (!showBalance) {
                  ref
                      .read(homePageControllerProvider.notifier)
                      .getUserBalance();
                }
                showBalance = !showBalance;
                setState(() {});
              },
            ),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Movimientos",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: secondaryColor,
                      size: 24,
                    ),
                    onPressed: () {
                      ref.invalidate(userLastYapeosProvider);
                    },
                  ),
                  //const VerticalDivider(),
                  OutlinedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const TransactionsRoute());
                    },
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.transparent),
                      ),
                    ),
                    child: const Text(
                      "Ver todos",
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(10),
          const Divider(),
          yapeoList.when(
              data: (yapeos) {
                return Column(
                  children: [
                    ...yapeos.map((yapeo) {
                      final isReceiver =
                          user!.userMetadata!['fullName'] == yapeo.receiverName;
                      return Column(
                        children: [
                          TransactionTile(
                            yapeo: yapeo,
                            isReceiver: isReceiver,
                          ),
                          const Divider(),
                        ],
                      );
                    }),
                  ],
                );
              },
              error: (error, stack) =>
                  Text("${error.toString()} \n ${stack.toString()}"),
              loading: () => const CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Yapeo yapeo;
  final bool isReceiver;

  const TransactionTile({
    super.key,
    required this.yapeo,
    required this.isReceiver,
  });

  bool _isToday(DateTime date) {
    return date.isAfter(DateTime.now().copyWith(hour: 0, minute: 0, second: 0));
  }

  bool _isYesterday(DateTime date) {
    return date.isAfter(DateTime.now()
            .subtract(const Duration(days: 1))
            .copyWith(hour: 0, minute: 0, second: 0)) &&
        date.isBefore(DateTime.now().copyWith(hour: 0, minute: 0, second: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () => AutoRouter.of(context).push(YapeDetailRoute(
            yapeData: yapeo, isReceiver: isReceiver, isNewYapeo: false)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isReceiver ? yapeo.senderName : yapeo.receiverName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const Gap(10),
                Text(
                  _isToday(yapeo.yapeoDate)
                      ? "Hoy ${DateFormat.jm().format(yapeo.yapeoDate)}"
                      : _isYesterday(yapeo.yapeoDate)
                          ? "Ayer ${DateFormat.jm().format(yapeo.yapeoDate)}"
                          : DateFormat('d MMM. yyyy - ')
                              .add_jm()
                              .format(yapeo.yapeoDate),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text(
              '${isReceiver ? '' : '-'} S/ '
              '${yapeo.yapeoAmount.toString()}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: isReceiver ? Colors.black : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuxiliaryButton extends StatelessWidget {
  final String imageUrl;
  final String buttonText;

  const AuxiliaryButton(
      {super.key, required this.imageUrl, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 60,
          height: 60,
        ),
        Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
