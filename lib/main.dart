import 'package:flutter/material.dart';
import 'package:interactions_flutter120/drag_n_drop.dart';

import 'interactive_view.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter 1.20 Widgets',
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Drag n drop'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DragExample(),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Iteractive View'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => InteractiveExample(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
