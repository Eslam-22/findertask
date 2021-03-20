import 'package:alice/alice.dart';
import 'package:findertask/extrawidget.dart';
import 'package:findertask/login.dart';
import 'package:findertask/signin.dart';
import 'package:flutter/material.dart';
import 'package:findertask/favourite.dart';
Alice alice = Alice(showNotification: true);  //help to make sure that request has been done

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: alice.getNavigatorKey(),
      home:Sign_in(),

      debugShowCheckedModeBanner: false,

    );
  }
}

