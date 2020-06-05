import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class DeclarativeWaySlide extends StatelessWidget {

  final double width, height;

  const DeclarativeWaySlide(this.width, this.height, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color.fromRGBO(57, 61, 103, 1), const Color(0xFF327682)])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
            child: Text(
              'Декларативный подход',
              style: TextStyle(color: Colors.white, fontSize: this.height / 18),
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 90),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: SyntaxView(
                    code: DeclarativeWaySlide.code,
                    syntax: Syntax.DART,
                    syntaxTheme: SyntaxTheme.dracula(),
                    withZoom: true,
                    withLinesCount: true,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.credit_card),
                              Text("Credit Card")
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(FlutterIcons.paypal_mco),
                              Text("PayPal")
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(FlutterIcons.cc_apple_pay_faw5d),
                              Text("Apple pay")
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  static final String code = """Container(
  decoration: BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(30)
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(Icons.credit_card),
          Text("Credit Card")
        ],
      ),
      Column(
        children: [
          Icon(FlutterIcons.paypal_mco),
          Text("PayPal")
        ],
      ),
      Column(
        children: [
          Icon(FlutterIcons.cc_apple_pay_faw5d),
          Text("Apple pay")
        ],
      )
    ],
  ),
);""";
}