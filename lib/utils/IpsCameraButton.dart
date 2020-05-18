import 'package:flutter/material.dart';

class IpsCameraButton extends StatelessWidget {
  final double size;
  final Function onPress;
  final Color color;
  final Icon icon;

  IpsCameraButton({
    this.size = 60,
    this.color: Colors.transparent,
    this.onPress,
    this.icon,
  });

  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints(
        minHeight: size,
        maxHeight: size,
        minWidth: size,
        maxWidth: size,
      ),
      fillColor: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
      ),
      child: icon ?? SizedBox.shrink(),
    );
  }
}
