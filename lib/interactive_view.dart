import 'package:flutter/material.dart';

class InteractiveExample extends StatelessWidget {
  InteractiveExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Interactive Viewer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'noscopedevs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InteractiveItem(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 10.0),
                        Icon(Icons.comment, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
              // child: InteractiveItem(),
            ),
          ),
        ],
      ),
    );
  }
}

class InteractiveItem extends StatefulWidget {
  const InteractiveItem({
    Key key,
  }) : super(key: key);

  @override
  _InteractiveItemState createState() => _InteractiveItemState();
}

class _InteractiveItemState extends State<InteractiveItem> {
  final controller = TransformationController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InteractiveViewer(
          transformationController: controller,
          minScale: 0.1,
          maxScale: 1.6,

          // boundaryMargin: EdgeInsets.all(20.0),
          // panEnabled: false,
          scaleEnabled: true,
          // onInteractionStart: (_) => print('START'),
          // onInteractionUpdate: (_) => print('UPDATE'),

          onInteractionEnd: (details) {
            print('END');
            setState(() {
              // print(controller.value);
              // controller.toScene(Offset(0, 0));

              controller.value = Matrix4.identity();
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              'https://images.unsplash.com/photo-1528372444006-1bfc81acab02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
