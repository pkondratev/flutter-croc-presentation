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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("CROC", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: height / 12),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: benefits.sublist(0,2).map((benefit) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(benefit.icon, color: Colors.white,),
                    Text(benefit.text, style: TextStyle(color: Colors.white,  fontSize: height / 24),)
                  ],
                )).toList(),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: benefits.sublist(2,4).map((benefit) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(benefit.icon, color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(benefit.text, style: TextStyle(color: Colors.white,  fontSize: height / 24),),
                    )
                  ],
                )).toList(),),
            )
          ],
        ),
      ),
    );
  }

  static final benefits = [
    CrocData(Icons.monetization_on, 'Дешевле'),
    CrocData(FlutterIcons.speedometer_sli, 'Быстрее'),
    CrocData(FlutterIcons.team_ant, 'Меньше проектных команд'),
    CrocData(FlutterIcons.money_off_mdi, "Он бесплатен"),
    CrocData(FlutterIcons.developer_board_mdi, "Быстрые прототипы")
  ];
}

class CrocData {
  final IconData icon;
  final String text;

  CrocData(this.icon, this.text);
}