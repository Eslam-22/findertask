import 'dart:async';
import 'package:findertask/models/emailresult.dart';
import 'package:findertask/models/resultemodel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatefulWidget {
  MyApp1({Key key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
   Future<EmailResult> futureAlbum;

  @override
  void initState() {
    super.initState();
    //futureAlbum = fetchemail();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<EmailResult>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.data.status.code == 200) {
               return Text('eslaaaam mail');
              }
              else {
                return Text(snapshot.data.status.message);
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}


