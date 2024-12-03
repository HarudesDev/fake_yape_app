import 'package:flutter/material.dart';

const mainColor = Color.fromRGBO(115, 36, 131, 1);

const mainColorDark = Color.fromRGBO(75, 25, 114, 1);

const mainColorLight = Color.fromRGBO(138, 61, 151, 1);

const secondaryColor = Color.fromRGBO(0, 184, 180, 1);

WidgetStateProperty<RoundedRectangleBorder> getRoundedRectangleBorder(
    double radius) {
  return WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}
