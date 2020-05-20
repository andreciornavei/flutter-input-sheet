import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:keyboard_utils/widgets.dart';

import 'inputs/IpsInput.dart';
import 'utils/colors.dart';

class Sheet {
  final BuildContext _context;
  final String _label;
  final String _cancelText;
  final String _doneText;
  final double paddingVertical;
  final bool showDoneButton;

  Sheet(
    this._context,
    this._label,
    this._cancelText,
    this._doneText, {
    this.paddingVertical: 25,
    this.showDoneButton: true,
  });

  open(IpsInput ipsInput) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: _context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return KeyboardSizeProvider(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0),
                height: 45,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: IpsColors.border, width: 1),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(_context);
                        ipsInput.onCancel();
                      },
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FeatherIcons.x,
                            size: 21,
                            color: IpsColors.dark,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            _cancelText,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: IpsColors.dark,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Visibility(
                      visible: showDoneButton == true,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ipsInput.onDone();
                        },
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              _doneText,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: IpsColors.dark,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              FeatherIcons.check,
                              size: 21,
                              color: IpsColors.dark,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                ),
                child: Column(
                  children: <Widget>[
                    Visibility(
                      visible: _label != null,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          _label ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: IpsColors.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ipsInput
                  ],
                ),
              ),
              KeyboardAware(
                builder: (context, keyboardConfig) {
                  return Consumer<ScreenHeight>(
                    builder: (context, _res, child) {
                      return SizedBox(
                        height: _res.keyboardHeight > 0
                            ? _res.keyboardHeight
                            : keyboardConfig.keyboardHeight > 0
                                ? keyboardConfig.keyboardHeight
                                : MediaQuery.of(_context).viewInsets.bottom !=
                                            null &&
                                        MediaQuery.of(_context)
                                                .viewInsets
                                                .bottom >
                                            0
                                    ? MediaQuery.of(_context).viewInsets.bottom
                                    : 0,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
