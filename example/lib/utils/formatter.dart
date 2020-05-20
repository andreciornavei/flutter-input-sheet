import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

class Formatters {

  static String dateToYMD(DateTime date) {
    return new DateFormat("yyyy/MM/dd").format(date);
  }

  static MoneyFormatterOutput formatUS(double currency) {
    return new FlutterMoneyFormatter(
      amount: currency,
      settings: MoneyFormatterSettings(
        symbol: 'U\$',
        thousandSeparator: ',',
        decimalSeparator: '.',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 2,
        compactFormatType: CompactFormatType.short,
      ),
    ).output;
  }
}
