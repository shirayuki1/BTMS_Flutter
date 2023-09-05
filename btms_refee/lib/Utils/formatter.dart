import 'package:intl/intl.dart';

class Formatter {
  static String date(DateTime? date, [String formatter = 'dd-MM-yyyy']) {
    if (date == null) return 'Date not set';
    return DateFormat(formatter).format(date);
  }

  static String date1(DateTime? time, [String formatter = 'hh:mm']) {
    if (time == null) return 'Time not set';
    return DateFormat(formatter).format(time);
  }

  static String date2(DateTime? date, [String formatter = 'yyyy-MM-dd']) {
    if (date == null) return 'Date not set';
    return DateFormat(formatter).format(date);
  }

  static String shorten(String? s, [int n = 30]) {
    if (s == null) {
      return '';
    }
    if (s.length < n) {
      return s;
    }
    var cut = s.indexOf(' ', n);
    if (cut == -1) return s;
    return '${s.substring(0, cut)} ...';
  }

  static String price(int? price, [String currency = "VNĐ"]) {
    final formatter = NumberFormat("###,###,###,###");
    return '${formatter.format(price)} $currency';
  }

  static String price2(double? price, [String currency = "VNĐ"]) {
    final formatter = NumberFormat("###,###,###,###");
    return '${formatter.format(price)} $currency';
  }

  // static String amount(double? amount, String? discountType, [String currency = "VNĐ"]) {
  //   if (amount == null || discountType == null) {
  //     return '';
  //   }
  //   if (discountType == Constants.discountTypeFixed) {
  //     final formatter = new NumberFormat("###,###,###,###");
  //     return '-' + formatter.format(amount) + ' $currency';
  //   }
  //   final formatter = new NumberFormat("###");
  //   return '-' + formatter.format(amount) + '%';
  // }
}
