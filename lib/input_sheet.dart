library input_sheet;

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'inputs/IpsInputDate.dart';
import 'inputs/IpsInputLongtext.dart';
import 'inputs/IpsInputMask.dart';
import 'inputs/IpsInputNumber.dart';
import 'inputs/IpsInputOptions.dart';
import 'inputs/IpsInputText.dart';
import 'sheet.dart';

class Ips {
  final BuildContext _context;
  final String label;
  final String cancelText;
  final String doneText;

  Ips(
    this._context, {
    this.label: "Label",
    this.cancelText: "Cancel",
    this.doneText: "Done",
  });

  text({
    TextInputType textInputType: TextInputType.text,
    String placeholder: "Placeholder",
    dynamic value,
    Function(dynamic) onDone,
  }) {
    IpsSheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputText(
      textInputType,
      placeholder,
      value,
      onDone,
    ));
  }

  longtext({
    String placeholder: "Placeholder",
    String value,
    Function(String) onDone,
  }) {
    IpsSheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputLongtext(
      onDone,
      placeholder: placeholder,
      value: value,
    ));
  }

  mask({
    TextInputType textInputType: TextInputType.text,
    String placeholder: "Placeholder",
    dynamic value,
    List<String> masks,
    Function(dynamic) onDone,
  }) {
    IpsSheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputMask(
      textInputType,
      placeholder,
      masks,
      value,
      onDone,
    ));
  }

  number({
    String placeholder: "Placeholder",
    double value,
    Function(double) onDone,
  }) {
    IpsSheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputNumber(
      onDone,
      placeholder: placeholder,
      value: value,
    ));
  }

  date({
    dynamic value,
    Function(String) onDone,
    DateTime minDateTime,
    DateTime maxDateTime,
    DateTimePickerLocale locale,
    String format,
    String pickerFormat,
  }) {
    IpsSheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(
      new IpsInputDate(
        onDone,
        value: value,
        locale: locale,
        format: format,
        pickerFormat: pickerFormat,
        minDateTime: minDateTime,
        maxDateTime: maxDateTime,
      ),
    );
  }

  options({
    dynamic value,
    Map<String, String> options,
    Function(String) onDone,
  }) {
    IpsSheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(
      new IpsInputOptions(
        onDone,
        value: value,
        options: options,
      ),
    );
  }

  slider() {}
  multioptions() {}
  photo() {}
  video() {}
}
