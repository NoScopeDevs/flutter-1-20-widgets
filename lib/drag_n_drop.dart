import 'package:flutter/material.dart';

const _strokeWidth = 8.0;

class DragExample extends StatefulWidget {
  @override
  _DragExampleState createState() => _DragExampleState();
}

class _DragExampleState extends State<DragExample> {
  static const _feedbackSize = Size(100.0, 100.0);
  static const _padding = 16.0;

  final list = [1, 2, 3];

  static final _decoration = BoxDecoration(
    border: Border.all(
      color: Colors.blue,
      width: _strokeWidth,
    ),
    borderRadius: BorderRadius.circular(15.0),
  );

  Widget _buildSourceRowChild(int index) => Flexible(
        child: Padding(
          padding: EdgeInsets.all(_padding),
          child: Draggable<int>(
            childWhenDragging: SizedBox(),
            data: index,
            dragAnchor: DragAnchor.pointer,
            //Widget que se muestra cuando el drag esta en proceso
            feedback: Transform.translate(
              offset: Offset(
                -_feedbackSize.width / 2.0,
                -_feedbackSize.height / 2.0,
              ),
              child: Container(
                decoration: _decoration,
                width: _feedbackSize.width,
                height: _feedbackSize.height,
                child: Image.asset('assets/images/marcos.png'),
              ),
            ),
            child: Container(
              // decoration: _decoration,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Text('Trash Me'),
                  Image.asset(
                    'assets/images/marcos.png',
                    width: _feedbackSize.width,
                    height: _feedbackSize.height,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildDragTargetChild() => Padding(
        padding: EdgeInsets.all(_padding),
        child: DragTarget<int>(
          builder: (_, candidateData, __) => Image.asset(
            'assets/images/trash.png',
            color: candidateData.isNotEmpty ? Color(0x2200FF00) : null,
          ),
          onAccept: (data) async {
            setState(() {
              list.removeLast();
            });
            if (list.isEmpty) {
              await showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Thanks'),
                  );
                },
              );
              Navigator.of(context).pop();
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Text(
              'CLEAN IT!',
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            Expanded(
              child: Row(
                children: list
                    .map(
                      (index) => _buildSourceRowChild(index),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: _buildDragTargetChild(),
            )
          ],
        ),
      ),
    );
  }
}
