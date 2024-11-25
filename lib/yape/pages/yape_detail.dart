import 'dart:developer';

import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:auto_route/auto_route.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

@RoutePage()
class YapeDetailPage extends StatefulWidget {
  const YapeDetailPage({super.key});

  @override
  State<YapeDetailPage> createState() => _YapeDetailPageState();
}

class _YapeDetailPageState extends State<YapeDetailPage> {
  final screenshotController = ScreenshotController();
  //Uint8List? _imageFile;
  bool isCapturing = false;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                        child: const YapeDetail(),
                      ),
                    )),
                const Gap(30),
                !isCapturing
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BottomButton(
                            //Todo investigar como hacer botón de compartir
                            text: "Compartir",
                            icon: Icons.share_outlined,
                            color: mainColorLight,
                            function: () {
                              setState(() {
                                isCapturing = true;
                              });
                              screenshotController
                                  .capture(
                                      delay: const Duration(milliseconds: 20))
                                  .then((capturedImage) {
                                log('Compartiendo');
                                setState(() {
                                  isCapturing = false;
                                });
                                _shareCapturedWidget(capturedImage!);
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
                    : const Gap(10),
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
  const YapeDetail({
    super.key,
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
              "69",
              style: TextStyle(
                color: mainColor,
                fontSize: 55,
              ),
            ),
          ],
        ),
        const Text(
          "Alejandro G. Risco D.",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "04 nov. 2024 - 8:30 pm",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
        const Gap(15),
        const Divider(),
        const DetailTile(
          firstString: "",
          secondString: "El que lee es Castillista",
        ),
        const DetailTile(
          firstString: "N° de celular: ",
          secondString: "*** *** 321",
        ),
        const DetailTile(
          firstString: "Destino: ",
          secondString: "Yape",
        ),
        const DetailTile(
          firstString: "N° de operación: ",
          secondString: "12345678",
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

// class YapeDetailClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const curvesNum = 25;
//     final horizontalOffset = size.width / curvesNum;

//     Path path = Path();
//     path.moveTo(0, size.height - 5);
//     //curvas de abajo
//     var startingXCoordinate = 0.0;
//     for (var i = 0; i < curvesNum; i++) {
//       path.cubicTo(
//         startingXCoordinate + horizontalOffset / 2,
//         size.height - 10,
//         startingXCoordinate + horizontalOffset / 2,
//         size.height,
//         startingXCoordinate + horizontalOffset,
//         size.height - 5,
//       );
//       startingXCoordinate += horizontalOffset;
//     }
//     path.lineTo(size.width, 5);
//     //curvas de arriba
//     startingXCoordinate = size.width;
//     for (var i = 0; i < 25; i++) {
//       path.cubicTo(
//         startingXCoordinate - horizontalOffset / 2,
//         10,
//         startingXCoordinate - horizontalOffset / 2,
//         0,
//         startingXCoordinate - horizontalOffset,
//         5,
//       );
//       startingXCoordinate -= horizontalOffset;
//     }

//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
