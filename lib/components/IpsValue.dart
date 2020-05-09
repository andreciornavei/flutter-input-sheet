import 'package:flutter/material.dart';

import '../colors.dart';

class IpsValue extends StatelessWidget {
  final String value;

  IpsValue(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.value,
      style: TextStyle(
        color: IpsColors.dark,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
    );
  }
}
