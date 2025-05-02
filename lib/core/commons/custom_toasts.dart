import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'package:vibemart/core/colors/colors.dart';

void showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: kSuccessColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showErrorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: kErrorColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
