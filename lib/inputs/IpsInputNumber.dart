import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../colors.dart';
import 'IpsInput.dart';

class IpsInputNumber implements IpsInput {
  final Function(double) _onDone;
  final double value;
  final String placeholder;
  final String decimalSeparator;
  final String thousandSeparator;
  final String leftSymbol;
  final int precision;
  MoneyMaskedTextController inputController;

  IpsInputNumber(
    this._onDone, {
    this.placeholder,
    this.value,
    this.decimalSeparator: "",
    this.thousandSeparator: "",
    this.leftSymbol: "",
    this.precision: 0,
  }) {
    this.inputController = inputController = new MoneyMaskedTextController(
      decimalSeparator: this.decimalSeparator,
      thousandSeparator: this.thousandSeparator,
      leftSymbol: this.leftSymbol,
      precision: this.precision,
      initialValue: value == null ? 0 : value,
    );
  }

  @override
  Widget widget() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
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
    _onDone(inputController.numberValue);
  }
}
