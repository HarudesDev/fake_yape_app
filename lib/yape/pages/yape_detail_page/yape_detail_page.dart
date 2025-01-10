import 'dart:developer';

import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
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
  final bool isNewYapeo;

  const YapeDetailPage({
    super.key,
    required this.yapeData,
    required this.isReceiver,
    required this.isNewYapeo,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                !widget.isNewYapeo
                    ? CloseButton(
                        color: Colors.white,
                        onPressed: () {
                          AutoRouter.of(context)
                              .replaceAll([const HomeRoute()]);
                        },
                      )
                    : const Gap(1),
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
                widget.isNewYapeo
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BottomButton(
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
                              AutoRouter.of(context)
                                  .replaceAll([const HomeRoute()]);
                            },
                          ),
                          BottomButton(
                            text: "Mis promos",
                            icon: Icons.local_offer_outlined,
                            color: secondaryColor,
                            function: () {},
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BottomButton(
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
                            text: "Nuevo Yapeo",
                            icon: Icons.send,
                            color: secondaryColor,
                            function: () {
                              final yapeo = widget.yapeData;
                              final yapeoContact = widget.isReceiver
                                  ? Contact(phones: [
                                      Phone("+51${yapeo.senderPhone}",
                                          normalizedNumber:
                                              "+51${yapeo.senderPhone}"),
                                    ], displayName: yapeo.senderName)
                                  : Contact(phones: [
                                      Phone("+51${yapeo.receiverPhone}",
                                          normalizedNumber:
                                              "+51${yapeo.receiverPhone}"),
                                    ], displayName: yapeo.receiverName);
                              AutoRouter.of(context)
                                  .push(MakeYapeRoute(contact: yapeoContact));
                            },
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
