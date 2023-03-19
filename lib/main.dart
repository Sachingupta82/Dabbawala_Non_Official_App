import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login.dart';


void main() {
  runApp(first());
}

class first extends StatefulWidget{
  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Dabbawala',
      home: Login(),
    );
  }
}