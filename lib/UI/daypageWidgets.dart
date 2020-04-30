import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitCardSmall extends StatelessWidget {
  FitCardSmall({this.parameter,this.concurrentdata,this.iconparam});

  final String concurrentdata;
  final String parameter;
  final Icon iconparam;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: Text(parameter.toUpperCase(),style: TextStyle(fontSize: 15,color: Colors.blueAccent,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,20.0,0,0),
            child: Text(concurrentdata.toString(),style: TextStyle(fontSize: 50 ,color: Colors.blueAccent,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Icon(iconparam.icon, color: Colors.blueAccent,size: 45.0,),
          ),
        ],
      ),
      width: double.maxFinite,
      height: double.maxFinite,

      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
       //boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 4.0)],
        color: Color(0x915c83),//000045
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.blueAccent, width: 2.0,style: BorderStyle.solid,),

      ),
    );
  }
}

class FitCardBig extends StatelessWidget {
  FitCardBig({this.parameter, this.concurrentdata,this.iconparam});

  final String parameter;
  final String concurrentdata;
  final Icon iconparam;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(parameter.toUpperCase(),style: TextStyle(fontSize: 15,color: Colors.blueAccent, fontWeight: FontWeight.bold,),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(concurrentdata.toString(),style: TextStyle(fontSize :50,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Icon(iconparam.icon,color: Colors.blueAccent,size: 36.0,),
          ),

        ],
      ),
      width: 340.0,
      height: 175.0,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      decoration: BoxDecoration(
     //   boxShadow: [BoxShadow(color: Colors.white,spreadRadius: 1.0,)],
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.blueAccent,width: 2.0,style : BorderStyle.solid),
      ),

    );
  }
}


class FitCardCustom extends StatelessWidget {
  FitCardCustom({this.parameter,this.iconparam});

  final String parameter;
  final Icon iconparam;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.fromLTRB(0, 50.0, 0, 0),
            child: Text(parameter.toUpperCase(),style: TextStyle(fontSize: 15,color: Colors.blueAccent,fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Icon(iconparam.icon, color: Colors.blueAccent,size: 45.0,),
          ),
        ],
      ),
      width: double.maxFinite,
      height: double.maxFinite,

      margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 15.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
         //boxShadow: [BoxShadow(color: Colors.white,spreadRadius: 1.0,)],
        color: Colors.black,
        //borderRadius: BorderRadius.circular(300.0),
        border: Border.all(color: Colors.blueAccent, width: 2.0,style: BorderStyle.solid,),

      ),
    );
  }
}

