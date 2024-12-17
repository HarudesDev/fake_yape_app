import 'dart:developer';

import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:auto_route/auto_route.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

import 'yape_detail.dart';
import 'yape_detail_components.dart';

@RoutePage()
class YapeDetailPage extends StatefulWidget {
  final Yapeo yapeData;
  final bool isReceiver;

  const YapeDetailPage({
    super.key,
    required this.yapeData,
    required this.isReceiver,
  });

  @override
  State<YapeDetailPage> createState() => _YapeDetailPageState();
}

class _YapeDetailPageState extends State<YapeDetailPage> {
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                mainColorDark,
                mainColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(45),
                //Todo Añadir la animación del yape
                const Gap(100),
                const Gap(45),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomPaint(
                      painter: YapeDetailPainter(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: YapeDetail(
                          yapeData: widget.yapeData,
                          isReceiver: widget.isReceiver,
                        ),
                      ),
                    )),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomButton(
                      //Todo investigar como hacer botón de compartir
                      text: "Compartir",
                      icon: Icons.share_outlined,
                      color: mainColorLight,
                      function: () {
                        screenshotController
                            .captureFromWidget(
                                YapeDetailScreenshot(
                                  yapeData: widget.yapeData,
                                  isReceiver: widget.isReceiver,
                                ),
                                delay: const Duration(milliseconds: 20))
                            .then((capturedImage) {
                          log('Compartiendo');
                          _shareCapturedWidget(capturedImage);
                        });
                      },
                    ),
                    BottomButton(
                      text: "Ir al inicio",
                      icon: Icons.home_outlined,
                      color: mainColorLight,
                      function: () {
                        AutoRouter.of(context).replaceAll([const HomeRoute()]);
                      },
                    ),
                    BottomButton(
                      text: "Mis promos",
                      icon: Icons.local_offer_outlined,
                      color: secondaryColor,
                      function: () {},
                    ),
                  ],
                ),
                const Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _shareCapturedWidget(Uint8List capturedImage) {
    Share.shareXFiles(
      [
        XFile.fromData(capturedImage, mimeType: 'image/png', name: 'detail.png')
      ],
      fileNameOverrides: ['detail.png'],
    );
  }
}
