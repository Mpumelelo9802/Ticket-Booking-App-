import 'package:flutter/material.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
    );
  }
}
