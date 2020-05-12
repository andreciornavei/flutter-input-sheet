import 'dart:io';
import 'dart:typed_data';

//import 'package:SiDivulg/sheets/ReproduceVideoSheet/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:input_sheet/utils/colors.dart';

class IpsVideo extends StatelessWidget {
  final Uint8List thumbnail;
  final Function onClick;
  final double radius;
  final bool readOnly;
  
  IpsVideo({this.radius: 10, this.onClick, this.thumbnail, this.readOnly: false});

  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: readOnly ? 0 : 15,
            bottom: readOnly ? 0 : 15,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: IpsColors.light,
                border: Border.all(color: IpsColors.border, width: 1),
                borderRadius: BorderRadius.circular(10),
                image: thumbnail != null
                    ? DecorationImage(
                        image: MemoryImage(thumbnail),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              alignment: Alignment.center,
              child: Visibility(
                visible: thumbnail == null,
                child: Icon(
                  FeatherIcons.video,
                  size: 26,
                  color: IpsColors.border,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: readOnly == false,
          child: Positioned(
            right: -5,
            bottom: -5,
            child: RawMaterialButton(
              onPressed: onClick,
              fillColor: IpsColors.dark,
              shape: CircleBorder(),
              constraints: BoxConstraints(
                minWidth: 30,
                maxWidth: 30,
                minHeight: 30,
                maxHeight: 30,
              ),
              child: Icon(
                thumbnail != null ? FeatherIcons.video : FeatherIcons.plus,
                size: 14,
                color: IpsColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
