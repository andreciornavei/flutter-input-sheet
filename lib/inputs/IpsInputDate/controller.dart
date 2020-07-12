import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part "controller.g.dart";

class IpsInputDateController = _IpsInputDateController
    with _$IpsInputDateController;

abstract class _IpsInputDateController with Store {
  _IpsInputDateController(String format, String value) {
    currentDate =
        value == null ? DateTime.now() : new DateFormat(format).parse(value);
  }

  @observable
  DateTime currentDate;

  @action
  setCurrentDate(DateTime newValue, List<int> ints) => currentDate = newValue;
}
