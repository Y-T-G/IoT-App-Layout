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
  Map _devices = {
    'living': [
      {'name': 'Lights (LR)', 'icon': AppIcons.lightbulb},
      {'name': 'Air Conditioner (LR)', 'icon': AppIcons.aircon},
      {'name': 'TV', 'icon': AppIcons.tv},
      {'name': 'Sound System', 'icon': AppIcons.sound_system},
    ],
    'bedroom': [
      {'name': 'Lights (BR)', 'icon': AppIcons.lightbulb},
      {'name': 'Air Conditioner (BR)', 'icon': AppIcons.aircon},
      {'name': 'Fan', 'icon': AppIcons.fan},
    ],
  };
  @override
  Widget build(BuildContext context) {
    final title = 'My Home';
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Living room',
                ),
                Tab(
                  text: 'Bedroom',
                ),
              ],
            ),
            title: Text(title),
          ),
          body: TabBarView(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children: [
                  //Looping to get all devices
                  for (MapEntry room in _devices.entries)
                    for (Map device in room.value)
                      DeviceWidget(device['name'], device['icon']),
                ],
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children: [
                  //Looping to get devices only in living room
                  for (Map device in _devices['living'])
                    DeviceWidget(device['name'], device['icon']),
                ],
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children: [
                  //Looping to get devices in bedroom
                  for (Map device in _devices['bedroom'])
                    DeviceWidget(device['name'], device['icon']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
