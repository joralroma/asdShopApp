import 'package:flutter/material.dart';

class InputModel {

  late TextEditingController _textEditingController;

  late String initText;

  late bool isSecure;

  InputModel({
    String? initText,
    bool? isSecure
  }) {
    this.initText = initText ?? '';
    this.isSecure = isSecure ?? false;
    _textEditingController = TextEditingController(text: this.initText);
  }

  TextEditingController get controller => _textEditingController;

  String get text => _textEditingController.text.trim();

  set text(String text) => _textEditingController.text = text;

  void dispose() {
    _textEditingController.dispose();
  }

  void onChange(Function onChange) {
    _textEditingController.addListener(() => onChange());
  }

}