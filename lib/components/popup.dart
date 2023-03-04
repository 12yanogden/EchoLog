import 'package:flutter/material.dart';

class Popup {
  final StatefulWidget widget;

  Popup({required this.widget});

  show(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return widget;
        });
  }
}
