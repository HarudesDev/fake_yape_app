import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../shared/auto_router.gr.dart';

@RoutePage()
class MakeYapePage extends StatefulWidget {
  const MakeYapePage({super.key});

  @override
  State<MakeYapePage> createState() => _MakeYapePageState();
}

class _MakeYapePageState extends State<MakeYapePage> {
  double _yapeAmount = 0;

  @override
  Widget build(BuildContext context) {
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
            const Text(
              "Contact name",
              style: TextStyle(
                color: mainColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
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
                        _yapeAmount = double.parse(value);
                      });
                      log(_yapeAmount.toString());
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
                        onPressed: () {
                          AutoRouter.of(context)
                              .replaceAll([const YapeDetailRoute()]);
                        },
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
