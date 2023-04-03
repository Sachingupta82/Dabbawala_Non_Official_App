import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Homepage.dart';
import 'package:flutter_application_1/screens/Navbarpage.dart';
import 'package:url_launcher/url_launcher.dart';


class notification extends StatefulWidget {
  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(89, 33, 20, 20),
              child: Text(
                'सूचना',
                style: TextStyle(fontSize: 32),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 98, 53, 114),
            leading: Padding(
              // padding: const EdgeInsets.fromLTRB(15,16,30,15),
              padding: EdgeInsets.all(11.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 32,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 222, 255),
        body: ListView(children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                ),
                SizedBox(width: size.width*0.04),
                Text('रितेशने काहीतरी पोस्ट केले आहे,',style: TextStyle(fontSize: 20),),
                GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Navbarpage()),);
                },
                child: Text(
                  'पाहूया',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
              ),
                
              ]),
            )
          ]),
        ]),
      )),
    );
  }
}
