import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_icons/flutter_icons.dart';


class Mystopmodalsheet extends StatefulWidget {
  @override
  _MystopmodalsheetState createState() => _MystopmodalsheetState();
}

class _MystopmodalsheetState extends State<Mystopmodalsheet> {

  bool startispressed =true;
  bool stopispressed=true;
  bool resetispressed = true;
  String stoptimetodisplay ="00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);



  void starttimer(){
    Timer(dur, keeprunning);
  }

  void keeprunning(){
    if(swatch.isRunning){
      starttimer();
    }
    setState(() {
      stoptimetodisplay = swatch.elapsed.inHours.toString().padLeft(2,"0")+":"+ (swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+
      ":"+(swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
    });

  }


  void startstopwatch(){
    setState(() {
      stopispressed=false;
      startispressed=false;
    });
    starttimer();
    swatch.start();

  }



  void stopstopwatch(){
    setState(() {
      stopispressed =true;
      resetispressed=false;
    });
    swatch.stop();

  }


  void resetstopwatch(){
    setState(() {
    startispressed=true;
    resetispressed=true;
    });
    swatch.reset();
    stoptimetodisplay = "00:00:00";
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
            )

        ),
          child: Column(
            children: <Widget>[
             Padding(
               padding:  EdgeInsets.only(top: 10.0),
               child: Text("Set Stopwatch",style: TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold),),
             ),
              Expanded(
                flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(stoptimetodisplay,
                    style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
                  ),),
              Expanded(flex:3,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: stopispressed? null: stopstopwatch,

                            color: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15.0,
                            ),
                            child: Icon(Icons.stop,color: Colors.black,
                            ),
                          ),
                          RaisedButton(
                            onPressed: resetispressed? null : resetstopwatch,
                            color: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15.0,
                            ),
                            child: Icon(MaterialCommunityIcons.restart,color: Colors.black,),
                          ),


                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        onPressed: startispressed? startstopwatch: null,
                        color: Colors.blueAccent,
                        hoverColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 15.0,
                        ),
                        child: Icon(MaterialCommunityIcons.clock_start),
                      ),

                    ],
                  ))
            ],
          ),
      ),
    );
  }
}
