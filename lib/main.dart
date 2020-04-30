import 'bmicalc.dart';
import 'analytics.dart';
import 'package:flutter/material.dart';
import 'daypage.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  int _selectedIndex=0;
  final _pageOptions = [
    DayPage(),
    BMICalc(),
    Analytics(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      initialRoute: '/',
//      routes: {
//        '/' : (context) => DayPage(),
//        '/second' : (context) =>BMICalc(),
//        '/third' : (context) => Analytics(),
//      },


      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child:
              Text('Fit Track',textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                  color : Colors.blueAccent,
                ),
              ),
              ListTile(
                title: Text('FAQ'),
                onTap: (){
                },
              ),
              ListTile(
                title: Text('Contact Us'),
                onTap: (){

                },
              )
            ],
          ),
        ),


        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueAccent),

          backgroundColor: Colors.black26,
          title: Text('Tracker',style: TextStyle(color: Colors.blueAccent),
          ),
          centerTitle: true,

        ),

        body: _pageOptions[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon : Icon(Feather.activity),
            title : Text('Tracker'),
          ),

          BottomNavigationBarItem(
            icon : Icon(Ionicons.md_body),
            title : Text('BMI'),
          ),
          BottomNavigationBarItem(
            icon : Icon(AntDesign.areachart),
            title : Text('Analysis'),
          ),
        ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          selectedFontSize: 16.0,
          iconSize: 20.0,
          unselectedFontSize: 12,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;

            });
          },
        ),
      ),
    );
  }
}



