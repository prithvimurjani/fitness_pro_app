import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fitnesspro/UI/daypageWidgets.dart';
import 'package:flutter/widgets.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fitnesspro/TimerStopwatchBackend/timer.dart';
import 'package:fitnesspro/TimerStopwatchBackend/stopwatch.dart';

class DayPage extends StatefulWidget {
  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  StreamSubscription<int> _subscription;
  String _stepCountValue = '0';
  double steps;
  String calburn;
  String diswalked;

  @override
  void initState() {

    super.initState();
    steppedcount();
    _stepCountValue = '0';
  }

  void steppedcount() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.pedometerStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void stopListening() {
    _subscription.cancel();
  }

  void _onData(int stepCountValue) async {
    setState(() {
      _stepCountValue = "$stepCountValue";
      var long2 = double.tryParse(_stepCountValue)?.toDouble();
      fitbrain(long2);
    });
  }

  void fitbrain(double value) {
    setState(() {
      var calburncalc = value * 0.04;
      calburn = calburncalc.toStringAsFixed(1);
      var diswalkedcalc = value * 0.0006;
      diswalked = diswalkedcalc.toStringAsFixed(2);
    });
  }

  void _onDone() => print('Finished pedometer tracking');

  void _onError(error) => print('Pedometer Error : $error');

  //Widget timer(BuildContext context) {

  //}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FitCardSmall(
                        parameter: 'Steps Walked',
                        concurrentdata: _stepCountValue,
                        iconparam: Icon(MaterialCommunityIcons.shoe_print),
                      ),
                    ),
                    Expanded(
                      child: FitCardSmall(
                        parameter: 'Calories Burned',
                        concurrentdata: '$calburn',
                        iconparam: Icon(MaterialCommunityIcons.fire),
                      ),
                    ),
                  ],
                ),
              ),
              FitCardBig(
                parameter: 'Distance Walked',
                concurrentdata: '$diswalked km',
                iconparam: Icon(MaterialCommunityIcons.map_marker_distance),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          setState(() {
                            Future(() => showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Mystopmodalsheet();
                                }));
                          });
                        },
                        child: FitCardCustom(
                          parameter: 'Stopwatch',
                          iconparam: Icon(Ionicons.ios_stopwatch),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          setState(() {
                            Future(() => showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return MyBottomModalSheet();
                                }));
                          });
                        },
                        child: FitCardCustom(
                          parameter: 'Timer',
                          iconparam: Icon(Ionicons.ios_fitness),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
