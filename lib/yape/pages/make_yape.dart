import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/auth/repositories/supabase_auth_repository.dart';
import 'package:fake_yape_app/shared/providers/yapeos_provider.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/repositories/supabase_database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../shared/auto_router.gr.dart';

@RoutePage()
class MakeYapePage extends ConsumerStatefulWidget {
  const MakeYapePage({super.key, required this.contact});

  final Contact contact;

  @override
  ConsumerState<MakeYapePage> createState() => _MakeYapePageState();
}

class _MakeYapePageState extends ConsumerState<MakeYapePage> {
  double _yapeoAmount = 0;
  final String _message = "";

  String formatNormalizedNumber(Phone contactPhone) =>
      "${contactPhone.normalizedNumber.substring(3, 6)}"
      "${contactPhone.normalizedNumber.substring(6, 9)}"
      "${contactPhone.normalizedNumber.substring(9)}";

  @override
  Widget build(BuildContext context) {
    final contactUser = ref.watch(
        userByPhoneProvider(formatNormalizedNumber(widget.contact.phones[0])));
    final databaseRepository = ref.read(supabaseDatabaseRepositoryProvider);
    final authRepository = ref.read(supabaseAuthRepositoryProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Yapear a"),
        actions: [
          CloseButton(
            onPressed: () {
              AutoRouter.of(context).replaceAll([const HomeRoute()]);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            contactUser.when(
              data: (data) => Text(
                data != null ? data.fullname : widget.contact.displayName,
                style: const TextStyle(
                  color: mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              error: (error, stack) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            Column(
              children: [
                IntrinsicWidth(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: "0",
                    //Todo Set the formatter
                    // inputFormatters: [
                    //   TextInputFormatter.withFunction((oldValue, newValue) {
                    //     if (newValue.text == "") {
                    //       return oldValue.copyWith(text: "0");
                    //     } else {
                    //       return double.parse(newValue.text) < 500.0
                    //           ? newValue.copyWith(
                    //               text: double.parse(newValue.text).toString())
                    //           : oldValue;
                    //     }
                    //   }),
                    //   FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    // ],
                    style: const TextStyle(
                      color: mainColor,
                      fontSize: 60,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        prefixText: "S/",
                        prefixStyle: TextStyle(
                          fontSize: 25,
                        )),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.bottom,
                    onChanged: (value) {
                      setState(() {
                        _yapeoAmount = value != "" ? double.parse(value) : 0;
                      });
                      log(_yapeoAmount.toString());
                    },
                  ),
                ),
                const Text(
                  "Límite por yapeo S/ 500, "
                  "límite total por día S/2, 000",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor)),
                    hintText: "Agregar mensaje",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: getRoundedRectangleBorder(5),
                          foregroundColor:
                              const WidgetStatePropertyAll(secondaryColor),
                          side: const WidgetStatePropertyAll(
                            BorderSide(color: secondaryColor),
                          ),
                        ),
                        child: const Text("Otros bancos"),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: contactUser.when(
                          data: (data) {
                            return data != null && _yapeoAmount > 0
                                ? () async {
                                    try {
                                      final sender = await databaseRepository
                                          .getUserByAuthId(
                                              authRepository.getUser!.id);
                                      final yapeoData =
                                          await databaseRepository.doYapeo(
                                              sender!.id,
                                              data.id,
                                              _yapeoAmount,
                                              _message);
                                      if (yapeoData != null) {
                                        // ignore: unused_result
                                        ref.refresh(userLastYapeosProvider);
                                        if (context.mounted) {
                                          AutoRouter.of(context).replaceAll([
                                            YapeDetailRoute(
                                              yapeData: yapeoData,
                                              isReceiver: false,
                                            )
                                          ]);
                                        }
                                      } else {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("Saldo insuficiente"),
                                          ));
                                        }
                                      }
                                    } catch (error) {
                                      print(error);
                                    }
                                  }
                                : null;
                          },
                          loading: () => null,
                          error: (error, stackTrace) => null,
                        ),
                        style: ButtonStyle(
                          shape: getRoundedRectangleBorder(5),
                          backgroundColor:
                              const WidgetStatePropertyAll(secondaryColor),
                          side: const WidgetStatePropertyAll(
                            BorderSide(color: Colors.transparent),
                          ),
                        ),
                        child: const Text(
                          "Yapear",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
