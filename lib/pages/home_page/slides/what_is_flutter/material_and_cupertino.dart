import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialAndCupertinoSlide extends StatelessWidget {
  final double width, height;

  const MaterialAndCupertinoSlide({Key key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF29478d), const Color(0xFF45287b)])),
      child: Row(
        children: [
          Expanded(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: AspectRatio(aspectRatio: 9 / 16, child: MaterialAppDemo()),
            )),
          ),
          Expanded(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: AspectRatio(aspectRatio: 9 / 16, child: CupertinoDemoApp()),
            )),
          )
        ],
      ),
    );
  }
}

class MaterialAppDemo extends StatefulWidget {
  const MaterialAppDemo({
    Key key,
  }) : super(key: key);

  @override
  _MaterialAppDemoState createState() => _MaterialAppDemoState();
}

class _MaterialAppDemoState extends State<MaterialAppDemo> {
  bool isChecked = true;
  double sliderValue = 0;

  int get currentIndex {
    if (sliderValue < 33) return 0;
    if (sliderValue >= 33 && sliderValue < 66) return 1;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material Demo'),
          ),
          body: Container(
            child: ListView(
              children: [
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        RaisedButton(child: Text('Button'), onPressed: () {}),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(child: Text('Button'), onPressed: () {}),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      value: null,
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          value: null,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                          title: Text('Check me!'),
                          value: isChecked,
                          secondary: const Icon(Icons.hourglass_empty),
                          onChanged: (value) {
                            setState(() {
                              isChecked = value;
                            });
                          })),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                          value: sliderValue,
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                          })),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SwitchListTile(
                          title: Text('Switch me!'),
                          value: isChecked,
                          secondary: const Icon(Icons.hourglass_empty),
                          onChanged: (value) {
                            setState(() {
                              isChecked = value;
                            });
                          })),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      )),
                ),
                Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                      )),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
              sliderValue = (index * 33) as double;
            }),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
            ],
          )),
    );
  }
}

class CupertinoDemoApp extends StatefulWidget {
  @override
  _CupertinoDemoAppState createState() => _CupertinoDemoAppState();
}

class _CupertinoDemoAppState extends State<CupertinoDemoApp> {
  int groupValue = 0;
  double sliderValue = 0;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
            ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Cupertino Demo'),
                ),
                child: ListView(
                  children: [
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoActivityIndicator(
                            animating: true,
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoButton(
                            child: Text('Button'),
                            onPressed: (){},
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoButton.filled(
                            child: Text('Button'),
                            onPressed: (){},
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoSegmentedControl(
                            children: {
                              0: Text('Auto'),
                              1: Text('Light'),
                              2: Text('Dark')
                            },
                            onValueChanged: (value) {
                              setState(() {
                                this.groupValue = value;
                              });
                            },
                            groupValue: this.groupValue,
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoSlider(
                            value: sliderValue,
                            onChanged: (v) => setState(()=>sliderValue = v),
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoSlidingSegmentedControl(
                            children: {
                              0: Text('Auto'),
                              1: Text('Light'),
                              2: Text('Dark')
                            },
                            onValueChanged: (value) {
                              setState(() {
                                this.groupValue = value;
                              });
                            },
                            groupValue: this.groupValue,
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MergeSemantics(
                            child: ListTile(
                              title: Text('Lights'),
                              trailing: CupertinoSwitch(
                                value: switchValue,
                                onChanged: (bool value) { setState(() { switchValue = value; }); },
                              ),
                              onTap: () { setState(() { switchValue = !switchValue; }); },
                            ),
                          )
                        ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoTextField(
                            controller: new TextEditingController(),
                            placeholder: 'Username',
                          )
                        ),
                    ),
                  ],
                )
              );
            },
          );
        },
      ),
    );
  }
}
