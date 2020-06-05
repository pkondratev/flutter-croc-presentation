import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/simple_text.dart';

class DoYouUseChromeSlide extends StatelessWidget {
  final double width, height;

  const DoYouUseChromeSlide(
    this.width,
    this.height, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleTextSlide(width, height,
        title: Text('Кто пользуется Chrome или Firefox?',
            style: TextStyle(color: Colors.white, fontSize: height / 12)),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('[ ', style: TextStyle(color: Colors.white70, fontSize: height / 18),), 
            Icon(FlutterIcons.chrome_faw, color: Colors.white70, size: height / 18), 
            Text(' , ', style: TextStyle(color: Colors.white70, fontSize: height / 18),),
            Icon(FlutterIcons.firefox_faw, color: Colors.white70, size: height / 18),
            Text(' , ... ]', style: TextStyle(color: Colors.white70, fontSize: height / 18),)
          ],
        ),
        gradient: [const Color(0xFF383392), const Color(0xFF3d8ac9)]);
  }
}
