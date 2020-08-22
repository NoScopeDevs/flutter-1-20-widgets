import 'package:flutter/material.dart';

class PickersExample extends StatefulWidget {
  @override
  _PickersExampleState createState() => _PickersExampleState();
}

class _PickersExampleState extends State<PickersExample> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  DateTimeRange _timeRange = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: 10)),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.toString())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              child: Text('Selecciona una fecha'),
              onPressed: () async {
                _dateTime = await showDatePicker(
                  context: context,
                  initialDate: _dateTime,
                  firstDate: DateTime.now().subtract(Duration(days: 10)),
                  lastDate: DateTime.now(),
                );

                setState(() {});
              },
            ),
            Text(
              _dateTime.toIso8601String(),
              style: Theme.of(context).textTheme.headline5,
            ),
            MaterialButton(
              child: Text('Selecciona un rango de fechas'),
              onPressed: () async {
                _timeRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(Duration(days: 10)),
                      lastDate: _dateTime,
                    ) ??
                    _timeRange;

                setState(() {});
              },
            ),
            Text(
              _timeRange.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            MaterialButton(
              child: Text('Selecciona una hora'),
              onPressed: () async {
                _timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: _timeOfDay,
                    ) ??
                    TimeOfDay.now();

                setState(() {});
              },
            ),
            Text(
              _timeOfDay.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
