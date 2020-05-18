import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../utils/colors.dart';
import 'IpsInput.dart';

class IpsInputText extends IpsInput {
  final TextInputType _textInputType;
  final String _value;
  final String _placeholder;
  final Function(String) _onDone;
  final bool autofocus;

  final _IpsInputText state = _IpsInputText();

  IpsInputText(
    this._textInputType,
    this._placeholder,
    this._value,
    this._onDone, {
    this.autofocus = false,
  });

  @override
  onDone() {
    if (_onDone != null) {
      state.done();
    }
  }

  @override
  State<StatefulWidget> createState() => state;
}

class _IpsInputText extends State<IpsInputText>
    with AfterLayoutMixin<IpsInputText> {
  TextEditingController inputController;

  void done() {
    this.widget._onDone(inputController.value.text);
  }

  @override
  void initState() {
    super.initState();
    this.inputController = new TextEditingController(
      text: this.widget._value ?? "",
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.show');
  }

  @override
  void dispose() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: this.widget.autofocus,
      textAlign: TextAlign.center,
      keyboardType: this.widget._textInputType,
      textInputAction: TextInputAction.done,
      controller: this.inputController,
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
