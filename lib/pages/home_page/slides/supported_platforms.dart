import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SupportedPlatformsSlide extends StatelessWidget {
  final double width, height;

  const SupportedPlatformsSlide(
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
          const Color(0xFF327682),
          const Color(0xFF532C67)
        ])),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: supportedPlatform
                  .map<Widget>((platform) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Icon(
                              platform["icon"],
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Text(platform['name'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 45)),
                          if (platform['beta'])
                            Text(
                              '  (beta)',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 30),
                            )
                        ],
                      ))
                  .toList(),
            ),
          ),
          Expanded(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              FlutterLogo(
                size: height / 3,
              ),
              Text("Supported platforms", style: TextStyle(color: Colors.white, fontSize: height / 10),)
            ]),
          ))
        ]));
  }

  

  static const supportedPlatform = [
    {"name": "iOS", "icon": FontAwesome5Brands.apple, "beta": false},
    {"name": "Android", "icon": FontAwesome5Brands.android, "beta": false},
    {"name": "Fuchsia", "icon": FontAwesome5Brands.google, "beta": false},
    {"name": "Web", "icon": FontAwesome5Brands.chrome, "beta": false},
    {"name": "Windows", "icon": FontAwesome5Brands.windows, "beta": true},
    {"name": "Mac OS", "icon": FontAwesome5Brands.apple, "beta": true},
    {"name": "Linux", "icon": FontAwesome5Brands.linux, "beta": true},
  ];
}
