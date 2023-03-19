import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class postpage extends StatefulWidget {
  // final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  const postpage({Key? key}) : super(key: key);
  @override
  State<postpage> createState() => _postpageState();
}

class _postpageState extends State<postpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width * 1.0,
                  height: size.height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0)),
                    color: Color.fromARGB(255, 11, 5, 5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                          radius: 60,
                        ),
                        title: Text(
                          'नमस्कार रितेश',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        subtitle: Text(
                          'तांत्रिक प्रमुख',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        trailing: Icon(Icons.notifications,
                            size: 30, color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 8,
                        color: Color.fromARGB(255, 215, 229, 215),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: size.width * 1.0,
                          height: size.height * 0.6,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: ListView(
                                  children: [
                                    Stack(
                                      children: [
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor: Colors.black,
                                                radius: 24,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                                                  radius: 22,
                                                ),
                                              ),
                                              title: Text('Ritesh'),
                                              subtitle: Text('wadala'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: NetworkImage(
                                          'https://cdn.zeebiz.com/sites/default/files/2016/12/27/11740-godrej-appliances-presenting-customised-cycles-fitted-with-chotukool-to-mumbai-dabbawala-association.JPG'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: TextFormField(
                                        cursorHeight: 25,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          labelText: 'वर्णन प्रविष्ट करा',
                                          border: OutlineInputBorder(),

                                          // fillColor: Colors.white,
                                          // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                                        ),
                                        maxLines: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton.extended(
                  label: Text('Post'),
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.send,
                    size: 24.0,
                  ),
                  onPressed: () {
                    //  Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
