import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
