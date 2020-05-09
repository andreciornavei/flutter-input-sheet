import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../colors.dart';
import 'IpsInput.dart';

class IpsInputMask implements IpsInput {
  final TextInputType _textInputType;
  final String _value;
  final String _placeholder;
  final List<String> _masks;
  final Function(String) _onDone;

  MaskedTextController maskedController;

  IpsInputMask(
    this._textInputType,
    this._placeholder,
    this._masks,
    this._value,
    this._onDone,
  ) {
    this.maskedController = new MaskedTextController(
      mask: identify(_value?.length ?? 0),
      text: _value ?? "",
    );

    maskedController.beforeChange = (String previous, String next) {
      maskedController.updateMask(identify(next.length), moveCursorToEnd: true);
      return true;
    };
  }

  String identify(int length) {
    for (String mask in this._masks) {
      if (length <= mask.length) {
        return mask;
      }
    }
    return this._masks[this._masks.length - 1];
  }

  @override
  Widget widget() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      keyboardType: _textInputType,
      textInputAction: TextInputAction.done,
      controller: maskedController,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: IpsColors.dark,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: _placeholder,
        hintStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          color: IpsColors.mute,
        ),
      ),
    );
  }

  @override
  onDone() {
    if (_onDone != null) {
      _onDone(maskedController.value.text);
    }
  }
}
