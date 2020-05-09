import 'package:flutter/material.dart';

import '../colors.dart';

class IpsLabel extends StatelessWidget {
  final String value;

  IpsLabel(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.value,
      style: TextStyle(
        color: IpsColors.mute,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        fontSize: 12,
      ),
    );
  }
}
