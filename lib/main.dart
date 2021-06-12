import 'package:first_app/app_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:first_app/device.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _iconMap = {'icon': AppIcons.lightbulb};
  @override
  Widget build(BuildContext context) {
    final title = 'My Home';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          children: [
            DeviceWidget('Kitchen Lights', AppIcons.lightbulb),
            DeviceWidget('Air Conditioner', AppIcons.aircon),
            DeviceWidget('Sound System', AppIcons.sound_system),
            DeviceWidget('Fan', AppIcons.fan),
            DeviceWidget('TV', AppIcons.tv),
          ],
        ),
      ),
    );
  }
}
