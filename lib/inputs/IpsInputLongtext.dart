import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';
import 'IpsInput.dart';

class IpsInputLongtext implements IpsInput {
  final String value;
  final String placeholder;
  final Function(String) _onDone;
  TextEditingController inputController;

  IpsInputLongtext(
    this._onDone, {
    this.value,
    this.placeholder,
  }) {
    this.inputController = new TextEditingController(
      text: this.value ?? "",
    );
  }

  @override
  Widget widget() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 8,
      controller: inputController,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: IpsColors.dark,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        border: InputBorder.none,
        hintText: placeholder,
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
