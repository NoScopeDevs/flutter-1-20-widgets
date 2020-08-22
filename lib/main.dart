import 'package:flutter/material.dart';

import 'sliders.dart';
import 'pickers.dart';
import 'drag_n_drop.dart';
import 'interactive_view.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 1.20 Widgets'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => showAboutDialog(
              context: context,
              applicationIcon: FlutterLogo(),
              applicationName: 'Más widgets',
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _ListItem(title: 'Drag and drop', child: DragExample()),
          _ListItem(title: 'Interactive View', child: InteractiveExample()),
          _ListItem(title: 'Sliders', child: SliderExample()),
          _ListItem(title: 'Pickers', child: PickersExample()),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key key, @required this.title, @required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Text(title),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => child),
          ),
        ),
      ),
    );
  }
}
