import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../utils/colors.dart';
import 'IpsInput.dart';

class IpsInputNumber extends IpsInput {
  final Function(double) _onDone;
  final double value;
  final String placeholder;
  final String decimalSeparator;
  final String thousandSeparator;
  final String leftSymbol;
  final String rightSymbol;
  final int precision;
  final bool autofocus;

  final _IpsInputNumber state = _IpsInputNumber();

  IpsInputNumber(this._onDone,
      {this.placeholder,
      this.value,
      this.decimalSeparator = "",
      this.thousandSeparator = "",
      this.leftSymbol = "",
      this.rightSymbol = "",
      this.precision = 0,
      this.autofocus = false});

  @override
  onDone() {
    if (_onDone != null) {
      state.done();
    }
  }

  @override
  State<StatefulWidget> createState() => state;
}

class _IpsInputNumber extends State<IpsInputNumber> {
  MoneyMaskedTextController inputController;

  void done() {
    this.widget._onDone(inputController.numberValue);
  }

  @override
  void initState() {
    super.initState();
    this.inputController = inputController = new MoneyMaskedTextController(
      decimalSeparator: this.widget.decimalSeparator,
      thousandSeparator: this.widget.thousandSeparator,
      leftSymbol: this.widget.leftSymbol,
      rightSymbol: this.widget.rightSymbol,
      precision: this.widget.precision,
      initialValue: this.widget.value == null ? 0 : this.widget.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: this.widget.autofocus,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
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
