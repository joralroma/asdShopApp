import 'package:flutter/material.dart';

// Widgets
import 'package:asdshop/app/ui/widgets/img.dart';

// Utils
import 'package:asdshop/app/utils/responsive.dart';

class ImgItem extends StatefulWidget {

  const ImgItem({
    Key? key,
    required this.url,
    required this.toggleUrl,
  }) : super(key: key);

  final String url;
  final Function(String) toggleUrl;

  @override
  _ImgItemState createState() => _ImgItemState();
}

class _ImgItemState extends State<ImgItem> {

  final ValueNotifier<bool> _status = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        children: [       
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 1
                  )
                ]
              ),
              child: AsdImg(url: widget.url),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _status,
            child: Container(
              color: Colors.black45,
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
            ),
            builder: (_, status, child) => status ? Positioned.fill(
              child: child!
            ) : const SizedBox.shrink()
          ),           
        ],
      ),
    );

  }


  void _onTap() {
    _status.value = !_status.value;
    widget.toggleUrl(widget.url);
  }

}