import 'package:flutter/material.dart';

class MeduzaSlide extends StatelessWidget {
  final double width, height;

  const MeduzaSlide({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [const Color(0xFF352884), Colors.black])
      ),
      child: Row(
        children: [
          Expanded(child: Center(child: Image.asset('assets/images/meduza.png', height: this.height / 3 * 2,),)),
          Expanded(child: Center(child: Image.asset('assets/images/meduza2.png', height: this.height / 3 * 2,),)),
          Expanded(child: Column(
            children: [
              Expanded(child: Center(child: Text('Медуза', style: TextStyle(color: Colors.white, fontSize: height / 16)))),
              Expanded(child: Center(child: Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Image.asset('assets/images/frame.png', height: height / 3,),
              )))
            ],
          ))
        ],
      ),
    );
  }
}