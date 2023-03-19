import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/documentpage.dart';
import 'package:flutter_application_1/screens/profilepage.dart';
// import 'package:flutter_application_1/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'postpage.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/postpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navbarpage extends StatefulWidget {
  const Navbarpage({super.key});

  @override
  State<Navbarpage> createState() => _NavbarpageState();
}

class _NavbarpageState extends State<Navbarpage> {
  int _selectedIndex = 0;

   List Screen=[
    Homepage(),
    DocumentPage(),
    postpage(),
    profilepage()
     ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBody: true,
       bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          backgroundColor: Color.fromARGB(255, 6, 4, 4),
          items: <Widget>[
            Icon(Icons.home, size: 25),
            Icon(Icons.document_scanner, size: 25),
            Icon(Icons.add, size: 25),
             Icon(Icons.person, size: 25),
          ],
          onTap: (index) {
            setState(() {
              
              _selectedIndex=index;
            });
           

          },
        ),
        body: Screen[_selectedIndex],
    );
  }
}