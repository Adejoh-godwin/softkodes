import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


numformat(number) {
  var symbol = "₦";
  if (number is String) {
    return "$symbol " + number;
  }
  return NumberFormat.currency(name: '$symbol ').format(number).toString();
}
// String globalUrl = 'http://127.0.0.1:8000/api/';
double mediaHeight = 0.00;
double mediaWidth = 0.00;
bool carUpdate = false;
Color b = Colors.black;
Color w = Colors.white;
sb(h, dp) {
  if (h == 'h') {
    return SizedBox(
      height: dp.toDouble(),
    );
  }
  return SizedBox(
    width: dp.toDouble(),
  );
}
esb(h, dp) {
  if (h == 'h') {
    return Expanded(
      child: SizedBox(
        height: dp.toDouble(),
      ),
    );
  }
  return Expanded(
    child: SizedBox(
      width: dp.toDouble(),
    ),
  );
}
double dp = mediaHeight * 0.02;
double dw = mediaWidth * 0.02;
