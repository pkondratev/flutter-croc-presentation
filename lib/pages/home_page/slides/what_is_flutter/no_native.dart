import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WhatIsFlutterNoNativeSlide extends StatefulWidget {
  final double width, height;

  const WhatIsFlutterNoNativeSlide({Key key, this.width, this.height})
      : super(key: key);

  @override
  _WhatIsFlutterNoNativeSlideState createState() =>
      _WhatIsFlutterNoNativeSlideState();
}

class _WhatIsFlutterNoNativeSlideState
    extends State<WhatIsFlutterNoNativeSlide> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('assets/images/no_native.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF532C67), const Color(0xFF383392)])),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Нативные компоненты',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white70,
                        fontSize: widget.height / 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Собственный рендеринг!',
                    style: TextStyle(
                        color: Colors.white, fontSize: widget.height / 18),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Image.asset(
            'assets/images/no_native.png',
            height: widget.height / 3 * 2,
          ))
        ],
      ),
    );
  }
}
