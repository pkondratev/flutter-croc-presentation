import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SpeedSlide extends StatefulWidget {
  final double width, height;

  const SpeedSlide({Key key, this.width, this.height}) : super(key: key);

  @override
  _SpeedSlideState createState() => _SpeedSlideState();
}

class _SpeedSlideState extends State<SpeedSlide> {

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('assets/images/sonic.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [const Color(0xFF3d8ac9), const Color(0xFF29478d)])
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: widget.height / 20),
                    children: [
                      TextSpan(text: 'SKIA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      TextSpan(text: ' и '),
                      TextSpan(text: 'Flutter', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                      TextSpan(text: ' гарантируют:')
                    ]
                  ),
                ),
              ]..addAll(['60 fps везде', '120 fps на устройствах с 120Hz', 'Выглядит одинаково'].map((e) => 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      children: [
                        Icon(FlutterIcons.check_ant, color: Colors.white, size: widget.height / 25,),
                        Text(e, style: TextStyle(color: Colors.white, fontSize: widget.height / 25), maxLines: 3,)
                      ],
                    ),
                ))),
            ),
          ),
          Expanded(child: Center(
            child: Image.asset('assets/images/sonic.png', height: this.widget.height / 2,),
          ))
        ],
      ),
    );
  }
}