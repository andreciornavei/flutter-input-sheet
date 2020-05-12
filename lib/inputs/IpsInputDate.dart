import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:input_sheet/inputs/IpsInput.dart';
import 'package:intl/intl.dart';

class IpsInputDate extends IpsInput {
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
  onDone() {
    if (_onDone != null) {
      _onDone(new DateFormat(this.format).format(this.currentDate));
    }
  }

  @override
  State<StatefulWidget> createState() => _IpsInputDate();
}

class _IpsInputDate extends State<IpsInputDate> {
  @override
  Widget build(BuildContext context) {
    return DatePickerWidget(
      locale: this.widget.locale,
      pickerTheme: DateTimePickerTheme(
        showTitle: false,
      ),
      dateFormat: this.widget.pickerFormat,
      minDateTime: this.widget.minDateTime,
      maxDateTime: this.widget.maxDateTime,
      initialDateTime: this.widget.currentDate,
      onChange: (DateTime newValue, List<int> ints) {
        this.widget.currentDate = newValue;
      },
    );
  }
}
