import 'package:flutter/material.dart';

// Models
import 'package:asdshop/app/models/input.dart';

// Utils
import 'package:asdshop/app/utils/theme.dart';
import 'package:asdshop/app/utils/responsive.dart';

class InputAsd extends StatelessWidget {

  const InputAsd({
    Key? key,
    required this.model,
    this.placeholder = '',
    this.maxLines = 1,
    this.colorText = Colors.white,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text
  }) : super(key: key);

  final InputModel model;
  final int maxLines;
  final String placeholder;
  final Color colorText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return TextFormField(
      maxLines: maxLines,
      textAlignVertical: (maxLines == 1) ? TextAlignVertical.center : TextAlignVertical.top,
      controller: model.controller,
      obscureText: model.isSecure,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: AsdTheme.styleText.copyWith(
        fontSize: _responsive.ip(1.8),
        color: colorText
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.only(top: 17, right: 20, bottom: 17, left: 20),
        errorStyle: TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AsdTheme.border,
            width: 1.5
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AsdTheme.border,
            width: 1.5
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        prefixStyle: TextStyle(
          color: AsdTheme.border
        ),
        labelText: placeholder,
        labelStyle: AsdTheme.styleText.copyWith(
          color: AsdTheme.placeholder,
          fontSize: _responsive.ip(1.8)
        )         
      ),
    );

  }

}