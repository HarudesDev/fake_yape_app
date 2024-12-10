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

//TODO Acomodar la apariencia de la screenshot
class YapeDetailScreenshot extends StatelessWidget {
  final Yapeo yapeData;
  final bool isReceiver;

  const YapeDetailScreenshot({
    super.key,
    required this.yapeData,
    required this.isReceiver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          const Gap(45),
          //Todo Añadir la animación del yape
          const Gap(100),
          const Gap(45),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomPaint(
                  painter: YapeDetailPainter(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: YapeDetail(
                      yapeData: yapeData,
                      isReceiver: isReceiver,
                    ),
                  ),
                )),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.function});
  final String text;
  final IconData icon;
  final Color color;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
            iconColor: const WidgetStatePropertyAll(Colors.white),
            shape: getRoundedRectangleBorder(10),
            elevation: const WidgetStatePropertyAll(0),
          ),
          child: Icon(icon),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class YapeDetail extends StatelessWidget {
  final Yapeo yapeData;
  final bool isReceiver;

  const YapeDetail({
    super.key,
    required this.yapeData,
    required this.isReceiver,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "¡Yapeaste!",
          style: TextStyle(
            color: mainColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "S/",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              yapeData.yapeoAmount.toString(),
              style: const TextStyle(
                color: mainColor,
                fontSize: 55,
              ),
            ),
          ],
        ),
        Text(
          isReceiver ? yapeData.senderName : yapeData.receiverName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          yapeData.yapeoDate.toString(),
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
        const Gap(15),
        const Divider(),
        yapeData.message != null
            ? DetailTile(
                firstString: "",
                secondString: yapeData.message!,
              )
            : const Gap(1),
        DetailTile(
          firstString: "N° de celular: ",
          secondString:
              isReceiver ? yapeData.senderPhone : yapeData.receiverPhone,
        ),
        const DetailTile(
          firstString: "Destino: ",
          secondString: "Yape",
        ),
        DetailTile(
          firstString: "N° de operación: ",
          secondString: yapeData.id.toString(),
        ),
      ],
    );
  }
}

class DetailTile extends StatelessWidget {
  final String firstString;
  final String secondString;

  const DetailTile({
    super.key,
    required this.firstString,
    required this.secondString,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstString,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            //Todo Corregir el overflow de texto
            Flexible(
              child: Text(
                secondString,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class YapeDetailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1.0;

    const curvesNum = 25;
    final horizontalOffset = size.width / curvesNum;

    Path path = Path();
    path.moveTo(0, size.height - 5);

    //curvas de abajo
    var startingXCoordinate = 0.0;

    for (var i = 0; i < curvesNum; i++) {
      path.quadraticBezierTo(
        startingXCoordinate + (horizontalOffset / 4),
        size.height - 5,
        startingXCoordinate + (horizontalOffset / 2),
        size.height - 2.5,
      );
      path.quadraticBezierTo(
        startingXCoordinate + (horizontalOffset / 4 * 3),
        size.height,
        startingXCoordinate + (horizontalOffset),
        size.height - 2.5,
      );
      startingXCoordinate += (horizontalOffset);
    }
    path.lineTo(size.width, 5);
    //curvas de arriba
    startingXCoordinate = size.width;
    for (var i = 0; i < curvesNum; i++) {
      path.quadraticBezierTo(
        startingXCoordinate - (horizontalOffset / 4),
        5,
        startingXCoordinate - (horizontalOffset / 2),
        2.5,
      );
      path.quadraticBezierTo(
        startingXCoordinate - (horizontalOffset / 4 * 3),
        0,
        startingXCoordinate - (horizontalOffset),
        2.5,
      );
      startingXCoordinate -= (horizontalOffset);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(YapeDetailPainter oldDelegate) => false;
}
