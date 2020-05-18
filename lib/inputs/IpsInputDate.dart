import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:input_sheet/inputs/IpsInput.dart';
import 'package:intl/intl.dart';

class IpsInputDate extends IpsInput {
  final Function(String) _onDone;
  final String value;
  final String format;
  final String pickerFormat;
  final DateTimePickerLocale locale;
  final DateTime minDateTime;
  final DateTime maxDateTime;

  final _IpsInputDate state = _IpsInputDate();

  IpsInputDate(
    this._onDone, {
    this.value,
    this.minDateTime,
    this.maxDateTime,
    this.locale = DateTimePickerLocale.en_us,
    this.format = "yyyy-MM-dd",
    this.pickerFormat = "yyyy|MMMM|dd",
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

class _IpsInputDate extends State<IpsInputDate> {
  DateTime _currentDate;

  void done() {
    this
        .widget
        ._onDone(new DateFormat(this.widget.format).format(_currentDate));
  }

  @override
  void initState() {
    super.initState();
    _currentDate = this.widget.value == null
        ? DateTime.now()
        : new DateFormat(this.widget.format).parse(this.widget.value);
  }

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
      initialDateTime: this._currentDate,
      onChange: (DateTime newValue, List<int> ints) {
        setState(() {
          _currentDate = newValue;
        });
      },
    );
  }
}
