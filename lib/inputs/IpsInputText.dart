import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';
import 'IpsInput.dart';

class IpsInputText implements IpsInput {
  final TextInputType _textInputType;
  final String _value;
  final String _placeholder;
  final Function(String) _onDone;
  TextEditingController inputController;

  IpsInputText(this._textInputType, this._placeholder,
      this._value, this._onDone) {
    this.inputController = new TextEditingController(
      text: this._value ?? "",
    );
  }

  @override
  Widget widget() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      keyboardType: _textInputType,
      textInputAction: TextInputAction.done,
      controller: inputController,
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
    _onDone(inputController.value.text);
  }
}
