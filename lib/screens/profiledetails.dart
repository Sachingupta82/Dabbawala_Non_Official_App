import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage2 extends StatefulWidget {
  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {

  String name = '';
  String location = '';
  String profilePhotoPath = '';

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
  void initState() {
    super.initState();
    getUserData();
  }

  final String bio =
      "Technical Head of Mumbai Dabbawala Association.";

  final String profileImageUrl =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Ritesh_andre.jpg/768px-Ritesh_andre.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile"),
        toolbarHeight: 80,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profileImageUrl),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            
            onPressed: () {
              //TODO: edit profile
            },
            child: Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}