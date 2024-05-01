import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool _isRunning = false;
  bool _isPaused = false;
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _isPaused = false;
    });
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 100), _updateTime);
  }

  void _pauseStopwatch() {
    setState(() {
      _isRunning = false;
      _isPaused = true;
    });
    _stopwatch.stop();
    _timer.cancel();
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      _isPaused = false;
    });
    _stopwatch.stop();
    _stopwatch.reset();
  }

  void _updateTime(Timer timer) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        _stopwatch.elapsed.inMinutes.toString().padLeft(2, '0') +
            ':' +
            (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
            ':' +
            (_stopwatch.elapsedMilliseconds % 1000 ~/ 10)
                .toString()
                .padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#1d3557"),
        title: Text('Stopwatch',
            style: TextStyle(
              color: HexColor("#f1faee"),
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              formattedTime,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: _isRunning
                        ? (_isPaused ? _startStopwatch : _pauseStopwatch)
                        : _startStopwatch,
                    child: Text(_isRunning
                        ? (_isPaused ? 'Resume' : 'Pause')
                        : 'Start'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: HexColor("#f1faee"),
                      backgroundColor: HexColor("#1d3557"),
                    )),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: _resetStopwatch,
                    child: Text('Reset'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: HexColor("#f1faee"),
                      backgroundColor: HexColor("#1d3557"),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
