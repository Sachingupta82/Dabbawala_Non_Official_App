import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



 
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();   
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
      debugShowCheckedModeBanner: false,
      title: 'Dabbawala', 
      home: Login(),
    );
  }
}