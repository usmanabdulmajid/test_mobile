import 'package:intl/intl.dart';

extension NumExtension on num {
  String get currency {
    final format = NumberFormat.simpleCurrency(name: 'NGN');
    final string = format.format(this);
    return string.substring(0, string.length - 3);
  }
}
