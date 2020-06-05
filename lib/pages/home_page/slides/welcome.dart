import 'package:flutter/material.dart';

class WelcomeSlide extends StatelessWidget {

  final double width, height;

  WelcomeSlide(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Container(
          height: height / 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(
                size: height / 3,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Flutter", style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: height / 5,
                    fontWeight: FontWeight.w200
                  ),),
                  Text("by Google", style: TextStyle(color: Colors.white, fontSize: height / 30,),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}