import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notification.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
 
}

class _HomepageState extends State<Homepage> {
  final CollectionReference _usersRef =
  FirebaseFirestore.instance.collection('Dabbawala_user');

  String _userName = '';
  String name = '';
  String location = '';
  String profilePhotoPath = '';
  // File imageFile;
  void getUserData() async {
  final phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;

  if (phoneNumber != null) {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Dabbawala_user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      setState(() {
          name = userData['name'];
          location = userData['location'];
          profilePhotoPath = userData['Profilephoto'];
          // imageFile = profilePhotoPath;
        });

    //   print('Name: $name');
    //   print('Location: $location');
    //   print('Profile Photo Path: $profilePhotoPath');
    // } else {
    //   print('No user found with the given phone number');
    // }
  } else {
    print('Nothing working');
  }
}
  }
 @override
  void initState(){
    super.initState();
    getUserData();
    
  }

  
  List posts = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 98, 53, 114),
              leading: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 8, top: 10, bottom: 1, right: 0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                  ),
                ),
              ),
              title: Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                child: Column(
                  children: [
                    // SizedBox(height: size.height*0.01),
                    Text("नमस्कार $name",
                      style: TextStyle(fontSize: 23),
                    ),
                    Text(
                      '$location',
                      style: TextStyle(fontSize: 16,fontWeight:FontWeight.normal ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: IconButton(
                    icon: Icon(Icons.notifications, size: 28.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notification()),
                      );
                      // getUserData();
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 234, 222, 255),

          // ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data!.docs[index];

                //   final userNameSnapshot = _usersRef.doc(post['userId']).get();
                // final userName = userNameSnapshot.data()!['name'] as String;

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 0,
                      shadowColor: Colors.black,
                      child: Column(
                        children: [
                          Text(
                                  post['username'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          if (post['imageUrl'] != null)
                            Image.network(
                              post['imageUrl'],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(width: 8.0),
                                
                                SizedBox(height: 8.0),
                                Text(
                                  post['content'],
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  post['timestamp'].toDate().toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                // Row(
                                //   children: [
                                //     IconButton(
                                //       icon: Icon(Icons.thumb_up),
                                //       onPressed: () {
                                //         // TODO: Implement like functionality
                                //       },
                                //     ),
                                //     SizedBox(width: 8.0),
                                //     Text(
                                //       post['likes'].toString(),
                                //       style: TextStyle(fontSize: 16.0),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
