import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomYapeLoader extends StatelessWidget {
  const CustomYapeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: mainColor,
            ),
            Text(
              "Yape",
              style: TextStyle(
                color: mainColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
