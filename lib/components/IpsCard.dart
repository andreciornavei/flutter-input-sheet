import 'package:flutter/material.dart';

import '../colors.dart';

class IpsCard extends StatelessWidget {
  final Widget label;
  final Widget value;
  final Widget icon;
  final Widget error;
  final Function onClick;

  IpsCard({
    @required this.label,
    @required this.value,
    this.icon,
    this.error,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onClick,
      color: Colors.white,
      highlightColor: Color.fromARGB(10, 0, 0, 0),
      splashColor: Color.fromARGB(10, 0, 0, 0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: IpsColors.border, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          this.label,
                          SizedBox(
                            height: 5,
                          ),
                          this.value,
                          this.error ?? SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  this.icon ?? SizedBox.shrink()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
