// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/Navbarpage.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:google_fonts/google_fonts.dart';

// class loadingpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color.fromARGB(255, 234, 222, 255),
//         body: Center(
//           child: Column(children: [
//             SizedBox(height: 250),
//             // Image.asset("images/cycle.png", width: 170, height: 120),
//             LoadingAnimationWidget.flickr(
//               size: 150,
//               leftDotColor: Colors.black,
//               rightDotColor: Colors.white,
//             ),
//             Text(
//               'कृपया प्रशासन तुमची विनंती मान्य करेपर्यंत प्रतीक्षा करा',
//               style: TextStyle(fontSize: 18,),
//             ),
//             SizedBox(height: 60),

//             ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (context) => Navbarpage()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 3,
//                         backgroundColor: Color(0xFF4e0064),
//                         shape: BeveledRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(5),
//                           ),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 40, vertical: 10),
//                         textStyle: const TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.normal,
//                           ),
//                       ),
//                       child: const Text(
//                         'Enter',
//                         style: TextStyle(
//                          color: Color.fromARGB(255, 245, 242, 241),
//                         ),
//                       ),
//                     ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Navbarpage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({super.key});

  
  @override
  _loadingpageState createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {
  bool booleanField = false;

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('Dabbawala_user');

  String _userName = '';
  String name = '';
  String location = '';
  String profilePhotoPath = '';
  // File imageFile;
  void getUserData() async {
  final phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;

  print('Phone Number: $phoneNumber');

  if (phoneNumber != null) {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Dabbawala_user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    print('Query Snapshot Size: ${querySnapshot.docs.length}');

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;

      if (doc.exists && doc['boolean_field'] == "true") {
        setState(() {
          booleanField = true;
        });
      }

      setState(() {
        name = doc['name'];
        // location = doc['location'];
        // profilePhotoPath = doc['Profilephoto'];
        // imageFile = profilePhotoPath;
      });

      //   print('Name: $name');
      //   print('Location: $location');
      //   print('Profile Photo Path: $profilePhotoPath');
    } else {
      print('No user found with the given phone number');
    }
  } else {
    print('Phone number is null');
  }
}


  @override
  void initState() {
    super.initState();
    getUserData();

    // Fetch the data from the Firestore
  }

  @override
  Widget build(BuildContext context) {
    if (booleanField== true) {
      print("Entering");
      // Redirect the user to the login page
      return const Navbarpage();
    } else {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 222, 255),
        body: Center(
          child: Column(children: [
            SizedBox(height: 250),
            LoadingAnimationWidget.flickr(
              size: 150,
              leftDotColor: Colors.black,
              rightDotColor: Colors.white,
            ),
            Text(
              'कृपया प्रशासन तुमची विनंती मान्य करेपर्यंत प्रतीक्षा करा',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 60),
            
          ]),
        ),
      );
    }
  }
}
  


// ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 elevation: 3,
//                 backgroundColor: Color(0xFF4e0064),
//                 shape: BeveledRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(5),
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 40, vertical: 10),
//                 textStyle: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight
// .normal,
//                 ),
//               ),
//               child: const Text(
//                 'Enter',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 245, 242, 241),
//                 ),
//               ),
//             ),