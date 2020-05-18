import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../utils/colors.dart';
import 'IpsInput.dart';

class IpsInputMask extends IpsInput {
  final TextInputType _textInputType;
  final String _value;
  final String _placeholder;
  final List<String> _masks;
  final Function(String) _onDone;
  final bool autofocus;

  final _IpsInputMask state = _IpsInputMask();

  IpsInputMask(this._textInputType, this._placeholder, this._masks, this._value,
      this._onDone,
      {this.autofocus = false});

  @override
  onDone() {
    if (_onDone != null) {
      state.done();
    }
  }

  @override
  State<StatefulWidget> createState() => state;
}

class _IpsInputMask extends State<IpsInputMask> {
  MaskedTextController maskedController;

  void done() {
    this.widget._onDone(maskedController.value.text);
  }

  String identify(int length) {
    for (String mask in this.widget._masks) {
      if (length <= mask.length) {
        return mask;
      }
    }
    return this.widget._masks[this.widget._masks.length - 1];
  }

  @override
  void initState() {
    super.initState();
    maskedController = new MaskedTextController(
      mask: identify(this.widget._value?.length ?? 0),
      text: this.widget._value ?? "",
    );
    maskedController.beforeChange = (String previous, String next) {
      maskedController.updateMask(identify(next.length), moveCursorToEnd: true);
      return true;
    };
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: this.widget.autofocus,
      textAlign: TextAlign.center,
      keyboardType: this.widget._textInputType,
      textInputAction: TextInputAction.done,
      controller: this.maskedController,
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
