import 'package:intl/intl.dart';

class FormateNumber {
  static String formate(double number) {
    final formatter = NumberFormat.compactCurrency(decimalDigits: 0, symbol: "")
        .format(number);

    return formatter;
  }
}
