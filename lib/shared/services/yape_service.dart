import 'dart:math';

import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YapeService {
  YapeService();

  bool isPeruvianNumber(Phone contactPhone) =>
      contactPhone.normalizedNumber.isEmpty
          ? false
          : (contactPhone.normalizedNumber.substring(0, 4) == "+519");

  bool isPeruvianPhoneNumber(String number) =>
      number.isNumeric() && number.length == 9 && number[0] == '9';

  String formatNormalizedNumber(Phone contactPhone, bool spaces) {
    final formattedNumber = "${contactPhone.normalizedNumber.substring(3, 6)} "
        "${contactPhone.normalizedNumber.substring(6, 9)} "
        "${contactPhone.normalizedNumber.substring(9)}";
    return spaces ? formattedNumber : formattedNumber.replaceAll(" ", "");
  }

  List<Point<int>> getContainerBoxPoints(Offset containerOffset,
          double xAxisMultiplier, double yAxisMultiplier) =>
      [
        Point<int>(
          (containerOffset.dx * xAxisMultiplier).toInt(),
          (containerOffset.dy * yAxisMultiplier).toInt(),
        ),
        Point<int>(
          ((containerOffset.dx + 200) * xAxisMultiplier).toInt(),
          (containerOffset.dy * yAxisMultiplier).toInt(),
        ),
        Point<int>(
          ((containerOffset.dx + 200) * xAxisMultiplier).toInt(),
          ((containerOffset.dy + 200) * yAxisMultiplier).toInt(),
        ),
        Point<int>(
          (containerOffset.dx * xAxisMultiplier).toInt(),
          ((containerOffset.dy + 200) * yAxisMultiplier).toInt(),
        ),
      ];
}

final yapeServiceProvider = Provider<YapeService>(
  (ref) => YapeService(),
);
