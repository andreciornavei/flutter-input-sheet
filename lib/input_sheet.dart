library input_sheet;

import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:input_sheet/inputs/IpsInputCamera.dart';
import 'package:input_sheet/utils/IpsMediaType.dart';
import 'package:input_sheet/utils/IpsModeCamera.dart';
import 'package:video_compress/video_compress.dart';

import 'inputs/IpsInputDate.dart';
import 'inputs/IpsInputLongtext.dart';
import 'inputs/IpsInputMask.dart';
import 'inputs/IpsInputNumber.dart';
import 'inputs/IpsInputOptions.dart';
import 'inputs/IpsInputText.dart';
import 'sheet.dart';

class InputSheet {
  final BuildContext _context;
  final String label;
  final String cancelText;
  final String doneText;
  final bool keyboardAutofocus;

  InputSheet(this._context,
      {this.label: "Label",
      this.cancelText: "Cancel",
      this.doneText: "Done",
      this.keyboardAutofocus: false});

  text({
    TextInputType textInputType: TextInputType.text,
    String placeholder: "Placeholder",
    dynamic value,
    Function(dynamic) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputText(
      textInputType,
      placeholder,
      value,
      onDone,
      autofocus: keyboardAutofocus,
    ));
  }

  longtext({
    String placeholder: "Placeholder",
    String value,
    Function(String) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputLongtext(
      onDone,
      placeholder: placeholder,
      value: value,
      autofocus: keyboardAutofocus,
    ));
  }

  mask({
    TextInputType textInputType: TextInputType.text,
    String placeholder: "Placeholder",
    dynamic value,
    List<String> masks,
    Function(dynamic) onDone,
  }) {
    Sheet(
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
      autofocus: keyboardAutofocus,
    ));
  }

  number({
    String placeholder: "Placeholder",
    double value,
    Function(double) onDone,
  }) {
    Sheet(
      this._context,
      this.label,
      this.cancelText,
      this.doneText,
    ).open(new IpsInputNumber(
      onDone,
      placeholder: placeholder,
      value: value,
      autofocus: keyboardAutofocus,
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
    Sheet(
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
    Sheet(
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

  photo({
    File file,
    String url,
    double height,
    ResolutionPreset resolution,
    String sufixRecordTimeout,
    String labelCompressing,
    String labelInitializingCamera,
    @required Function(File, Uint8List) onDone,
  }) {
    Sheet(
      this._context,
      null,
      this.cancelText,
      this.doneText,
      paddingVertical: 0,
      showDoneButton: false,
    ).open(
      new IpsInputCamera(
        onDone,
        IpsMediaType.PHOTO,
        IpsModeCamera.BACK,
        MediaQuery.of(_context).padding.top,
        file: file,
        url: url,
        height: height,
        resolution: resolution,
        sufixRecordTimeout: sufixRecordTimeout,
        labelCompressing: labelCompressing,
        labelInitializingCamera: labelInitializingCamera,
      ),
    );
  }

  video({
    File file,
    String url,
    double height,
    VideoQuality compress,
    ResolutionPreset resolution,
    int timeRecordLimit,
    String sufixRecordTimeout,
    String labelCompressing,
    String labelInitializingCamera,
    @required Function(File, Uint8List) onDone,
  }) {
    Sheet(
      this._context,
      null,
      this.cancelText,
      this.doneText,
      paddingVertical: 0,
      showDoneButton: false,
    ).open(
      new IpsInputCamera(
        onDone,
        IpsMediaType.VIDEO,
        IpsModeCamera.BACK,
        MediaQuery.of(_context).padding.top,
        file: file,
        url: url,
        height: height,
        compress: compress,
        resolution: resolution,
        timeRecordLimit: timeRecordLimit,
        sufixRecordTimeout: sufixRecordTimeout,
        labelCompressing: labelCompressing,
        labelInitializingCamera: labelInitializingCamera,
      ),
    );
  }

  //TO-DO
  //slider() {}
  //colors() {}
  //multioptions() {}
}
