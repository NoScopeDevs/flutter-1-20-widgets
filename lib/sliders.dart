import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _value = 10.0;
  RangeValues _rangeValues = const RangeValues(40.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toString())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SliderTheme(
            data: SliderThemeData(
              // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorTextStyle: TextStyle(fontSize: 30.0),
            ),
            child: Slider(
              min: 0,
              max: 100,
              divisions: 5,
              value: _value,
              label: _value.round().toString(),
              onChanged: (value) => setState(() => _value = value),
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.amber,
              activeTrackColor: Colors.amber,
              inactiveTrackColor: Colors.grey,
              valueIndicatorColor: Colors.amber,
              rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
            ),
            child: RangeSlider(
              min: 0,
              max: 100,
              values: _rangeValues,
              divisions: 5,
              labels: RangeLabels(
                _rangeValues.start.round().toString(),
                _rangeValues.end.round().toString(),
              ),
              onChanged: (values) => setState(() => _rangeValues = values),
            ),
          ),
        ],
      ),
    );
  }
}
