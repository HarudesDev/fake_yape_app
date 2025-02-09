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

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/yape_logo2.png",
              width: 250,
            ),
            const Text(
              "Con el respaldo del BCP",
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({super.key, required this.error});
  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(child: Text(error.toString())),
    );
  }
}
