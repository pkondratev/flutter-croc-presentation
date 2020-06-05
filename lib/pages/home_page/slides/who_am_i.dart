import 'package:flutter/material.dart';
import 'package:flutter_presentation_croc/widgets/github/main.dart';
import 'package:transparent_image/transparent_image.dart';

class WhoAmISlide extends StatelessWidget {
  final double width, height;

  const WhoAmISlide(this.width, this.height, {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = this.height / 3;
    return Container(
      width: width,
      color: const Color.fromRGBO(21, 36, 52, 1),
      child: Stack(
        children: [
          Center(
            child: MainLayout()),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 108.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Container(
                      height: imageSize, width: imageSize,
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage), 
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.cover,)//Image.asset('assets/images/avatar.png', fit: BoxFit.cover,)),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Павел Кондратьев', style: TextStyle(fontSize: imageSize / 4, color: Colors.white),),
                        Text('.Net-Разработчик в ДРПО', style: TextStyle(fontSize: imageSize / 8, color: Colors.white70))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}