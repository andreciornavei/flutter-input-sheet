import 'package:flutter/material.dart';

import '../utils/colors.dart';

class IpsIcon extends StatelessWidget {
  final IconData icon;

  IpsIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Icon(
      this.icon,
      color: IpsColors.mute,
      size: 26,
    );
  }
}
