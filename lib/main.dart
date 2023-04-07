import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/Homepage.dart';
import 'package:flutter_application_1/screens/Navbarpage.dart';
import 'screens/login1.dart';


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
  var auth = FirebaseAuth.instance;
  var isLogin =false;
  checkifLogin() async {
    auth.authStateChanges().listen((User? user)
    {
      if(user != null && mounted){
        setState(() {
          isLogin = true;
        });
      }
    });
  }
  @override
  void initState(){
    checkifLogin();
    PaintingBinding.instance.imageCache.clear();
    super.initState();
  }
  @override 
  Widget build(BuildContext context){ 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dabbawala', 
      home: isLogin? const Navbarpage() : PhoneAuthPage(),
    );
  }
}