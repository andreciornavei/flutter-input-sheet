import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/colors.dart';
import 'IpsInput.dart';

class IpsInputText extends IpsInput {
  final TextInputType _textInputType;
  final String _value;
  final String _placeholder;
  final Function(String) _onDone;
  final bool autofocus;
  TextEditingController inputController;

  IpsInputText(
    this._textInputType,
    this._placeholder,
    this._value,
    this._onDone,{
      this.autofocus: false,
    }
  ) {
    this.inputController = new TextEditingController(
      text: this._value ?? "",
    );
  }

  @override
  onDone() {
    _onDone(inputController.value.text);
  }

  @override
  State<StatefulWidget> createState() => _IpsInputText();
}

class _IpsInputText extends State<IpsInputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: this.widget.autofocus,
      textAlign: TextAlign.center,
      keyboardType: this.widget._textInputType,
      textInputAction: TextInputAction.done,
      controller: this.widget.inputController,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: IpsColors.dark,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: this.widget._placeholder,
        hintStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          color: IpsColors.mute,
        ),
      ),
    );
  }
}
