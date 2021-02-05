import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final checkAll = ColorListItems(title: 'Add ons');
  final colorList = [
    ColorListItems(title: 'Cheese'),
    ColorListItems(title: 'Peppers'),
    ColorListItems(title: 'Olives'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
            children: [
              toggleCheckbox(checkAll),
              Divider(),
              ...colorList.map(multipleCheckbox).toList(),
              // customCheckbox(),
            ],
          )),
    );
  }

  Widget toggleCheckbox(ColorListItems cList) =>
      customCheckbox(colorList: cList, onClicked:(){
        final newValue = !cList.value;
        setState(() {
          checkAll.value = newValue;
          colorList.forEach((colorList){
            colorList.value = newValue;
          });
        });
      });

  Widget multipleCheckbox(ColorListItems colorList)
  => customCheckbox(
      colorList: colorList,
      onClicked: () {
        setState(() {
          final newValue = !colorList.value;
          colorList.value = newValue;
        });
      });

  Widget customCheckbox({
    @required ColorListItems colorList,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: colorList.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          colorList.title,
        ),
      );
}

class ColorListItems {
  String title;
  bool value;

  ColorListItems({
    @required this.title,
    this.value = false,
  });
}
