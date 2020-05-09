import 'package:flutter/material.dart';

import '../colors.dart';

class IpsError extends StatelessWidget {
  final String message;

  IpsError(this.message);

  @override
  Widget build(BuildContext context) {
    return this.message == null
        ? SizedBox.shrink()
        : Text(
            this.message,
            style: TextStyle(
              color: IpsColors.red,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              fontSize: 11,
            ),
          );
  }
}
