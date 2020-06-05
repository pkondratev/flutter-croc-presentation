import 'package:flutter/material.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_icons/flutter_icons.dart';

class IAmFlutterSlide extends StatelessWidget {
  final double width, height;

  const IAmFlutterSlide(
    this.width,
    this.height, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromRGBO(37, 91, 149, 1),
        const Color.fromRGBO(57, 61, 103, 1)
      ])),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Я Flutter ", style: TextStyle(color: Colors.white, fontSize: height / 8),),
                Icon(FontAwesome5.smile_wink, color: Colors.white, size: height / 8,)
              ],
            ),
            Text("И сейчас я запущен $platformName", style: TextStyle(color: Colors.white70, fontSize: height / 12),),
              Text(!kIsWeb ? "Может сменим платформу?" : 'Отлично, можно продолжать', 
                style: TextStyle(color: !kIsWeb ? Colors.orange : Colors.green, fontSize: height / 17),)
          ],
        ),
      ),
    );
  }

  String get platformName {
    if (kIsWeb) return "в Браузере";
    if (Platform.isAndroid) return "на Android";
    if (Platform.isIOS) return "на iOS";
    if (Platform.isFuchsia) return "на Fuchsia";
    if (Platform.isWindows) return "на Windows";
    if (Platform.isLinux) return "на Linux";
    if (Platform.isMacOS) return "на MacOS";
    return "хз где...";
  }
}
