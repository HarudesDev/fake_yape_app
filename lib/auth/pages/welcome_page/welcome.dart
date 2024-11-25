import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:fake_yape_app/shared/style.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static final _carouselData = <Map<String, String>>[
    {
      'imageUrl': 'assets/images/welcome_page_1.png',
      'title': 'Envía y recibe dinero',
      'body': "Transfiere gratis a toda la comunidad yapera "
          "desde tu celular."
    },
    {
      'imageUrl': 'assets/images/welcome_page_2.png',
      'title': 'Paga en establecimientos',
      'body': "Visita tu restaurante o negocio favorito y "
          "olvídate del efectivo."
    },
    {
      'imageUrl': 'assets/images/welcome_page_3.png',
      'title': 'Retiro en agentes y cajeros BCP',
      'body': "Retira hasta S/500 al día en cualquier agente "
          "o cajero BCP a nivel nacional."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: CarouselView(
                    backgroundColor: Colors.transparent,
                    controller: CarouselController(initialItem: 0),
                    itemExtent: 380,
                    children: _carouselData.map((carouselItem) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            carouselItem['imageUrl']!,
                            width: 300,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 2.0),
                            child: Center(
                              child: Text(
                                carouselItem['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            carouselItem['body']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(secondaryColor),
                    shape: getRoundedRectangleBorder(10.0),
                  ),
                  onPressed: () {
                    AutoRouter.of(context).push(const RegisterRoute());
                  },
                  child: const Text(
                    "CREAR UNA CUENTA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Gap(10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(mainColorLight),
                    shape: getRoundedRectangleBorder(10.0),
                  ),
                  onPressed: () {
                    AutoRouter.of(context).push(const LoginRoute());
                  },
                  child: const Text(
                    "YA TENGO UNA CUENTA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
