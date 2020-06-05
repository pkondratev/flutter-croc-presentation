import 'package:flutter/material.dart';

class SimpleTextSlide extends StatelessWidget {
  final double width, height;
  final Widget title, subtitle;
  final List<Color> gradient;

  const SimpleTextSlide(this.width, this.height, {Key key, @required this.title, @required this.gradient, this.subtitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: this.gradient)
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            if (subtitle != null) subtitle
          ],
        ),
      ),
    );
  }
}