import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class WhatIsFlutterDartSlide extends StatefulWidget {
  final double width, height;

  const WhatIsFlutterDartSlide(
    this.width,
    this.height, {
    Key key,
  }) : super(key: key);

  @override
  _WhatIsFlutterDartSlideState createState() => _WhatIsFlutterDartSlideState();

  static final String code = """import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }

}""";
}

class _WhatIsFlutterDartSlideState extends State<WhatIsFlutterDartSlide> {

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('assets/images/Dart_logo.png'), context);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF352884), const Color(0xFF327682)])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/Dart_logo.png', height: widget.height / 10, width: widget.height / 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Dart',
                    style: TextStyle(color: Colors.white, fontSize: widget.height / 10),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 128),
            child: SyntaxView(
              code: WhatIsFlutterDartSlide.code,
              syntax: Syntax.DART,
              syntaxTheme: SyntaxTheme.dracula(),
              withZoom: true,
              withLinesCount: true,
            ),
          ))
        ],
      ),
    );
  }
}
