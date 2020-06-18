import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/colors.dart';
import 'IpsInput.dart';

class IpsInputLongtext extends IpsInput {
  final bool autofocus;
  final String value;
  final String placeholder;
  final Function(String) _onDone;

  final _IpsInputLongtext state = _IpsInputLongtext();

  IpsInputLongtext(
    this._onDone, {
    this.autofocus = false,
    this.value,
    this.placeholder,
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

class _IpsInputLongtext extends State<IpsInputLongtext> {
  TextEditingController inputController;

  void done() {
    this.widget._onDone(inputController.value.text);
  }

  @override
  void initState() {
    super.initState();
    this.inputController = new TextEditingController(
      text: this.widget.value ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: this.widget.autofocus,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 8,
      controller: this.inputController,
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
