import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ConsAndProsSlide extends StatelessWidget {
  final double width, height;

  const ConsAndProsSlide(
    this.width,
    this.height, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xFF162047), const Color(0xFF532C67)])),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          FlutterIcons.cross_ent,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Text('Библиотек меньше, чем для нативной разработки',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          FlutterIcons.check_ent,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                      Text('Важнейшие библиотеки уже есть,\nпостоянно выходят новые',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Container(height: 2, color: Colors.white,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          FlutterIcons.cross_ent,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Text('Интерфейс создается с помощью кода,\nиз-за чего грань между логикой и дизайном гораздо тоньше',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          FlutterIcons.check_ent,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                      Text('Интерфейс легко разбивается на отдельные модули',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Container(height: 2, color: Colors.white,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          FlutterIcons.cross_ent,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Text('Отсутствует (пока), набор компонентов\nдля Windows, Mac и Linux',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          FlutterIcons.check_ent,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                      Text('Платформы официально добавились недавно,\nдело времени',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ],
                  ),
                ]),
          ),
          Expanded(
              child: Center(
            child: Text(
              "Минусы",
              style: TextStyle(color: Colors.white, fontSize: height / 10),
            ),
          ))
        ]));
  }
}
