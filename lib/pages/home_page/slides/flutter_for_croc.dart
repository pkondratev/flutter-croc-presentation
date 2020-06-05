import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FlutterForCrocSlide extends StatelessWidget {
  final double width, height;

  const FlutterForCrocSlide({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black, const Color(0xFF162047)])
      ),
      child: Center(
        child: Text("CROC", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: height / 8),),
      ),
    );
  }
}

class CrocData {
  final IconData icon;
  final String text;

  CrocData(this.icon, this.text);
}