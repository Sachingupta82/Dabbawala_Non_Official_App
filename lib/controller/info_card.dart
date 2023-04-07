import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCardsPage extends StatefulWidget {
  final String location;

  UserCardsPage({required this.location});

  @override
  _UserCardsPageState createState() => _UserCardsPageState();
}

class _UserCardsPageState extends State<UserCardsPage> {
  final CollectionReference _usersRef =
  FirebaseFirestore.instance.collection('Dabbawala_user');

  
  String locationn = '';
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
          // name = userData['name'];
          locationn = userData['location'];
          // profilePhotoPath = userData['Profilephoto'];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 222, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 53, 114),
        title: Text('User Cards'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('customers')
            .where('location', isEqualTo: locationn)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No documents found'),
            );
          }

          return ListView(
  children: snapshot.data!.docs.map((document) {
    final documentData = document.data() as Map<String, dynamic>;
    final id = documentData['Id'] ?? '';
    final location = documentData['Location'] ?? '';
    final name = documentData['Name'] ?? '';
    final status = documentData['Status'] ?? '';

    return Card(
  elevation: 4,
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ID: $id',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Name: $name',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Location: $location',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Status: $status', 
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
);

  }).toList(),
);

        },
      ),
    );
  }
}
