import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:intl/intl.dart';

import 'IpsInput.dart';

class IpsInputDate implements IpsInput {
  Function(String) _onDone;
  String value;
  String format;
  String pickerFormat;
  DateTimePickerLocale locale;
  DateTime minDateTime;
  DateTime maxDateTime;
  DateTime currentDate;

  IpsInputDate(
    this._onDone, {
    this.value,
    this.minDateTime,
    this.maxDateTime,
    this.locale: DateTimePickerLocale.en_us,
    this.format: "yyyy-MM-dd",
    this.pickerFormat: "yyyy|MMMM|dd",
  }) {
    currentDate = this.value == null
        ? DateTime.now()
        : new DateFormat(this.format).parse(this.value);
  }

  @override
  Widget widget() {
    return DatePickerWidget(
      locale: this.locale,
      pickerTheme: DateTimePickerTheme(
        showTitle: false,
      ),
      dateFormat: this.pickerFormat,
      minDateTime: minDateTime,
      maxDateTime: maxDateTime,
      initialDateTime: currentDate,
      onChange: (DateTime newValue, List<int> ints) {
        currentDate = newValue;
      },
    );
  }

  @override
  onDone() {
    if (_onDone != null) {
      _onDone(new DateFormat(this.format).format(this.currentDate));
    }
  }
}
