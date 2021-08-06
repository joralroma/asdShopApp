import 'package:asdshop/app/utils/theme.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:asdshop/app/utils/responsive.dart';

class AsdTextItem extends StatelessWidget {

  const AsdTextItem({
    Key? key,
    required this.label,
    required this.text,
    this.maxLines = 1
  }) : super(key: key);

  final String label, text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 120,
            child: Text(
              '$label: ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AsdTheme.styleText.copyWith(
                fontSize: _responsive.ip(1.8),
              ),              
            ),
          ),
          Expanded(
            child: Text(
              text,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: AsdTheme.styleText.copyWith(
                fontSize: _responsive.ip(1.8),
                fontFamily: 'OpenSasSemiBold'
              ),            
            ),
          ),
        ],
      ),
    );

  }

}