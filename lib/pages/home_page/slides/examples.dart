import 'package:flutter/material.dart';

class ExampleSlide extends StatelessWidget {
  final double width, height;
  final Widget additionalLogo;
  final List<ExampleData> data;
  final List<Color> gradient;

  const ExampleSlide({
    Key key,
    @required this.height, @required this.width,
    this.additionalLogo,
    @required this.data, @required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: this.gradient)
      ),
      child: Column(
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(this.data.length, (index) => Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 9/16,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: new Image.asset(this.data[index].image, fit: BoxFit.fitHeight,),),
                            Text(this.data[index].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey, fontSize: height / 20),),
                            // Expanded(child: Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(this.data[index].content, maxLines: 8,),
                            // ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              )),
          )),
          if (this.additionalLogo != null) Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: this.additionalLogo,
          )
        ],
      ),
    );
  }

}

class ExampleData {
  final String image, title, content;

  ExampleData(this.image, this.title, this.content);
}