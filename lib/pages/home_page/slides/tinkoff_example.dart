import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TinkoffExampleSlide extends StatefulWidget {
  final double width, height;

  const TinkoffExampleSlide(this.width, this.height, {Key key,}) : super(key: key);

  @override
  _TinkoffExampleSlideState createState() => _TinkoffExampleSlideState();
}

class _TinkoffExampleSlideState extends State<TinkoffExampleSlide> {

  int currentState = 0;

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('assets/images/tinkoff_desktop.png'), context);
    precacheImage(AssetImage('assets/images/tinkoff_mobile.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final imagesSize = widget.height / 2;

    return Container(
      width: widget.width,
      decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromRGBO(21, 36, 52, 1),
          const Color.fromRGBO(37, 91, 149, 1)
        ])),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Тинькофф', style: TextStyle(color: const Color(0xFFFADD56), fontSize: 36),),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(currentState != 2 
                ? 'Досрочное погашение'
                : 'Изменение паспортных данных, адресов', style: TextStyle(color: Colors.white, fontSize: 32)
              )
            ),
          ),
          Positioned.fill(child: Row(children: [
            IconButton(icon: Icon(Icons.arrow_left), onPressed: currentState != 0 ? () {
              setState(() {
                currentState -= 1;
              });
            } : null),
            Expanded(child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: imagesSize,
                  child: Image.asset('assets/images/tinkoff_mobile.png', fit: BoxFit.fitHeight,)
                ),
                Container(
                  width: imagesSize / 2,
                  height: imagesSize / 2,
                  child: AnimatedCrossFade(
                    firstChild: Icon(FlutterIcons.cross_ent, size: imagesSize / 2, color: Colors.red,), 
                    secondChild: Icon(FlutterIcons.check_ent, size: imagesSize / 2, color: Colors.green,), 
                    crossFadeState: [0,2].contains(currentState) ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
                    duration: const Duration(seconds: 1)),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 76),
              child: Container(width: 2, color: Colors.white,),
            ),
            Expanded(child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: imagesSize,
                  child: Image.asset('assets/images/tinkoff_desktop.png', fit: BoxFit.fitHeight,)
                ),
                Container(
                  width: imagesSize / 2,
                  height: imagesSize / 2,
                  child: AnimatedCrossFade(
                    firstChild: Icon(FlutterIcons.cross_ent, size: imagesSize / 2, color: Colors.red,), 
                    secondChild: Icon(FlutterIcons.check_ent, size: imagesSize / 2, color: Colors.green,), 
                    crossFadeState: CrossFadeState.showSecond, 
                    duration: const Duration(seconds: 1)),
                )
              ],
            )),
            IconButton(icon: Icon(Icons.arrow_right), onPressed: currentState < 2 ? () {
              setState(() {
                currentState += 1;
              });
            } : null),
          ],))
        ],
      ),
    );
  }
}