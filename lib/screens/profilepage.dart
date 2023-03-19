import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);
  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 215, 229, 215),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Column(children: [
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              label: Text('Name:'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              label: Text('Employee Id:'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              label: Text('Mobile No:'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              label: Text('Address:'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              label: Text('Email:'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              label: Text('D.O.B:'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width*0.15),
                          FloatingActionButton.extended(
                            label: Text('Save'), // <-- Text
                            backgroundColor: Colors.black,
                            icon: Icon(
                              Icons.person,
                              // size: 24.0,
                            ),
                            onPressed: () {
                      //  Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage()));
                            },
                          ),
                          SizedBox(width: size.width*0.03),
                          FloatingActionButton.extended(
                            label: Text('Logout'),
                            backgroundColor: Colors.black,
                            icon: Icon(
                              Icons.logout,
                              
                            ),
                            onPressed: () {
                      //  Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage()));
                            },
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
