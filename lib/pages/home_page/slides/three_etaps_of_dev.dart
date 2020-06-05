import 'package:bubble_timeline/bubble_timeline.dart';
import 'package:bubble_timeline/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ThreeEtapsOfDevSlide extends StatelessWidget {
  final double width, height;

  const ThreeEtapsOfDevSlide(
    this.width,
    this.height, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
          child: Container(
          width: this.width,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromRGBO(37, 91, 149, 1),
        const Color(0xFF352884)
      ])),
          child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Классическая разработка', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50),),
              Expanded(
                child: BubbleTimeline(
                  bubbleDiameter: 60,
                  items: classicDev
                      .map((e) => TimelineItem(
                          title: e['text'],
                          icon: Icon(e['icon']),
                          bubbleColor: Colors.grey))
                      .toList(),
                  stripColor: Colors.teal,
                  scaffoldColor: Colors.white,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Flutter разработка', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50),),
              Expanded(
                child: BubbleTimeline(
                  bubbleDiameter: 60,
                  items: flutterDev
                      .map((e) => TimelineItem(
                          title: e['text'],
                          icon: Icon(e['icon']),
                          bubbleColor: Colors.grey))
                      .toList(),
                  stripColor: Colors.teal,
                  scaffoldColor: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
          ),
        ),
    );
  }

  static const classicDev = [
    {'text': 'Analitics', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Develop IOS', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Develop Web', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Develop Android', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Test IOS', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Test Web', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Test Android', 'icon': FlutterIcons.microsoft_mco},
    {'text': 'Release', 'icon': FlutterIcons.microsoft_mco}
  ];
  static const flutterDev = [
    {'text': 'Analitics', 'icon': FlutterIcons.microsoft_mco },
    {'text': 'Develope Flutter app', 'icon': FlutterIcons.microsoft_mco },
    {'text': 'Test app', 'icon': FlutterIcons.microsoft_mco },
    {'text': 'Release', 'icon': FlutterIcons.microsoft_mco }
  ];
}
