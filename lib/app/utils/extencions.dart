import 'package:asdshop/app/models/shopping.dart';

extension StringExtensions on String {

  bool get valid {
    return (this.trim().isNotEmpty);
  }

  DateTime get toDateTime {
    try {
      return DateTime.parse(this).toLocal();
    } catch (e) {
      return DateTime.now();
    }
  }

}

extension DateTimeExtensions on DateTime {

  String get toTimeCard {
    return '${this.year}/${this.month}/${this.day}';
  }

}

extension StringNullExtensions on String? {

  bool get valid {
    return (this != null && this!.trim().isNotEmpty);
  }

}

extension ListShoppingNullExtensions on List<Shopping>? {

  bool get isNull {
    return (this == null);
  }

  bool get isNotNull {
    return !this.isNull;
  }

}