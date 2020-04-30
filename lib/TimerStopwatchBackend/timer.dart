import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';





class MyBottomModalSheet extends StatefulWidget {
  @override
  _MyBottomModalSheetState createState() => _MyBottomModalSheetState();
}

class _MyBottomModalSheetState extends State<MyBottomModalSheet> {

  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timetodisplay = "00:00:00";
  bool checktimer =true;


  void start() {
    setState(() {
      started=false;
      stopped=false;
    });
    timeForTimer = ((hour * 60 * 60) + (min * 60) + sec);
    print(timeForTimer);
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if(timeForTimer < 1 || checktimer==false){
          timer.cancel();
          checktimer=true;
          timetodisplay="0";
          started=false;
          stopped=false;
        }
        if(timeForTimer<60){
          timetodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer-1;
          started=true;
          stopped=true;
        }
        else if (timeForTimer<3600){
          int m = timeForTimer ~/60;
          int s = timeForTimer - (60*m);
          timetodisplay = m.toString() +":" + s.toString();
          timeForTimer = timeForTimer -1;
        }
        else{
          int h = timeForTimer ~/3600;
          int t = timeForTimer - (3600 * h );
          int m = t~/60;
          int s = t -(60*m);
          timetodisplay = h.toString() + ":" + m.toString() + ":" + s.toString();
          timeForTimer=timeForTimer-1;
        }

      });

    });
  }

  void stop() {

    setState(() {
      started = true;
      stopped=false;
      checktimer=false;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Set Timer',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top :16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "HH",
                        style:
                        TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                      ),
                      NumberPicker.integer(
                          initialValue: 0,
                          minValue: 0,
                          maxValue: 23,
                          onChanged: (val) {
                            setState(() {
                              hour = val;
                            });
                          })
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "MM",
                        style:
                        TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                      ),
                      NumberPicker.integer(
                          initialValue: min,
                          minValue: 0,
                          maxValue: 59,
                          onChanged: (vals) {
                            setState(() {
                              min = vals;
                            });
                          })
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SS",
                        style:
                        TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                      ),
                      NumberPicker.integer(

                          initialValue: sec,
                          minValue: 0,
                          maxValue: 59,
                          onChanged: (valss) {
                            setState(() {
                              sec = valss;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top:40.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: started ? start : null,
                        padding: EdgeInsets.symmetric(horizontal: 40.0,
                        vertical: 15.0),
                        color: Colors.black,
                        //padding: EdgeInsets.symmetric(horizontal: 80.0),
                        child: Icon(
                          Icons.play_circle_filled,
                          color: Colors.blueAccent,

                        ),
                      ),
                      SizedBox(height: 10.0,),
                      RaisedButton(
                        onPressed: stopped? null : stop,
                        padding: EdgeInsets.symmetric(horizontal: 40.0,
                            vertical: 15.0),
                        color: Colors.black,
                        //padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Icon(
                          Icons.stop,
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),

                  Text(
                    timetodisplay,
                    style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

