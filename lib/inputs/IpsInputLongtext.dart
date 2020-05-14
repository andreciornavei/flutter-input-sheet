import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/colors.dart';
import 'IpsInput.dart';

class IpsInputLongtext extends IpsInput {
  final bool autofocus;
  final String value;
  final String placeholder;
  final Function(String) _onDone;
  TextEditingController inputController;

  IpsInputLongtext(
    this._onDone, {
    this.autofocus = false,
    this.value,
    this.placeholder,
  }) {
    this.inputController = new TextEditingController(
      text: this.value ?? "",
    );
  }

  @override
  onDone() {
    _onDone(inputController.value.text);
  }

  @override
  State<StatefulWidget> createState() => _IpsInputLongtext();
}

class _IpsInputLongtext extends State<IpsInputLongtext> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: this.widget.autofocus,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 8,
      controller: this.widget.inputController,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: IpsColors.dark,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        border: InputBorder.none,
        hintText: this.widget.placeholder,
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
