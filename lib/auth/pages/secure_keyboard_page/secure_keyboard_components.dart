import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';

class SecureKeyboardKey extends StatelessWidget {
  const SecureKeyboardKey({
    super.key,
    required this.keyNumber,
    required this.onPress,
  });
  final String keyNumber;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              shape: getRoundedRectangleBorder(10),
              backgroundColor: const WidgetStatePropertyAll(mainColorLight),
            ),
            child: Text(
              keyNumber,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
