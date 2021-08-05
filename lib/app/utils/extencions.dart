extension StringExtensions on String {

  bool get valid {
    return (this.trim().isNotEmpty);
  }

}

extension StringNullExtensions on String? {

  bool get valid {
    return (this != null && this!.trim().isNotEmpty);
  }

}