// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// // Reference to the root of the Firebase Realtime Database
// final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

// // Function to authenticate a user based on their employee id and mobile number
// Future<UserCredential> signInWithEmployeeIdAndMobileNumber(String employeeId, String mobileNumber) async {
//   // Query the Firebase Realtime Database for the user with the provided employee id
//   DataSnapshot dataSnapshot = await databaseReference.child('users').orderByChild('employeeId').equalTo(employeeId).once();

//   // Check if the user exists in the database
//   if (dataSnapshot.value == null) {
//     throw FirebaseAuthException(message: 'User not found');
//   }

//   // Get the user's mobile number from the database
//   String storedMobileNumber = dataSnapshot.value.values.first['mobileNumber'];

//   // Check if the provided mobile number matches the one in the database
//   if (mobileNumber != storedMobileNumber) {
//     throw FirebaseAuthException(message: 'Incorrect mobile number');
//   }

//   // Authenticate the user with Firebase Authentication
//   UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

//   return userCredential;
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   late String _employeeId, _mobileNumber;
//   bool _isLoading = false;

//   void _submit() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         UserCredential userCredential = await signInWithEmployeeIdAndMobileNumber(_employeeId, _mobileNumber);
//         // Authentication successful, navigate to the next screen
//         Navigator.pushReplacementNamed(context, '/nextScreen');
//       } on FirebaseAuthException catch (e) {
//         setState(() {
//           _isLoading = false;
//         });
//         // Authentication failed, show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(e.message),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Employee ID',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your employee ID';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         _employeeId = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Mobile Number',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your mobile number';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         _mobileNumber = value;
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _submit,
//                       child: Text('Login'),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/screens/Login.dart';

// // class Login1 extends StatefulWidget {
// //   @override
// //   State<Login1> createState() => _Login1State();
// // }

// // class _Login1State extends State<Login1> {
// //   final formKey = GlobalKey<FormState>();
// //   final phoneController = TextEditingController();
// //   final idController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     // final size = MediaQuery.of(context).size;
// //     return MaterialApp(
// //       home: SafeArea(
// //         child: Scaffold(
// //             resizeToAvoidBottomInset: false,
// //             backgroundColor: Colors.grey,
// //             body: Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     SizedBox(width: 20),
// //                     Text(
// //                       'फोन नंबर :',
// //                       style: TextStyle(fontSize: 30),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(
// //                   width: 380,
// //                   child: TextFormField(
// //                     controller: phoneController,
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'फोन नंबर आवश्यक आहे';
// //                       } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
// //                         return 'अवैध फोन नंबर';
// //                       }
// //                       return null;
// //                     },
// //                     keyboardType: TextInputType.number,
// //                     cursorHeight: 25,
// //                     cursorWidth: 3,
// //                     // cursorColor: Colors.black,
// //                     textAlign: TextAlign.start,
// //                     decoration: InputDecoration(
// //                       prefixIcon: Icon(Icons.phone),

// //                       filled: true,
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(32.0),
// //                       ),
// //                       fillColor: Colors.white,
// //                       // label:  Text('नाव',style: TextStyle(fontSize: 40),),
// //                     ),
// //                   ),
// //                 ),
// //                 Row(
// //                 children: [
// //                   SizedBox(width: 20),
// //                   Text(
// //                     'कर्मचारी आयडी :',
// //                     style: TextStyle(fontSize: 30),
// //                   ),
// //                 ],
// //               ),

// //               SizedBox(
// //                 width: 380,
// //                 child: TextFormField(
// //                   controller: idController,
// //                    validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'नाव आवश्यक आहे';
// //                     }
// //                     return null;
// //                   },
// //                   cursorHeight: 25,
// //                   textAlign: TextAlign.start,
// //                   decoration: InputDecoration(
// //                     prefixIcon: Icon(Icons.numbers),
// //                     contentPadding: EdgeInsets.symmetric(
// //                         vertical: 20.0, horizontal: 15.0),
// //                     filled: true,
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(32.0),
// //                     ),
// //                     fillColor: Colors.white,
// //                     // label:  Text('नाव',style: TextStyle(fontSize: 40),),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 25),
// //               Row(children: [
// //                 Text('नोंदणीकृत वापरकर्ता नाही?'),
// //                 TextButton(
// //               onPressed: () {
// //                 Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
// //                 );
// //               },
// //               style: TextButton.styleFrom(

// //                 textStyle: const TextStyle(
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.normal,
// //                   ),
// //               ),
// //               child: const Text(
// //                 'नोंदणी करा',
// //                 style: TextStyle(
// //                   color: Color.fromARGB(255, 18, 16, 1),
// //                 ),
// //               ),
// //             ),
// //               ],)
// //               ],
// //             )),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/screens/Login.dart';
// import 'package:flutter_application_1/screens/Navbarpage.dart';

// import 'Homepage.dart';

// class PhoneAuthPage extends StatefulWidget {
//   const PhoneAuthPage({super.key});

//   @override
//   _PhoneAuthPageState createState() => _PhoneAuthPageState();
// }

// class _PhoneAuthPageState extends State<PhoneAuthPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _smsController = TextEditingController();

//   late String _verificationId;
//   final user = FirebaseAuth.instance.currentUser;
  


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 234, 222, 255),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 98, 53, 114),
//         title: Center(child: Text('लॉगिन', style: TextStyle(fontSize: 22))),
//       ),
//       body: Builder(builder: (BuildContext context) {
//         final size = MediaQuery.of(context).size;
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               width: size.width * 0.82,
//               child: TextFormField(
//                 controller: _phoneNumberController,
//                 // decoration: const InputDecoration(labelText: 'Phone number '),
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.phone),
//                   fillColor: Colors.white,
//                   filled: true,
//                   labelText: 'फोन नंबर',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: BorderSide.none),
//                   floatingLabelBehavior: FloatingLabelBehavior.never,
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   _verifyPhoneNumber(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   elevation: 5,
//                   backgroundColor: Color.fromARGB(255, 98, 53, 114),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(29),
//                     ),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                 ),
//                 child: Text(
//                   "ओटीपी पाठवा",
//                   style: TextStyle(fontSize: 17),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.07,
//             ),
//             SizedBox(
//               width: size.width * 0.82,
//               child: TextFormField(
//                 controller: _smsController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.verified_user),
//                   fillColor: Colors.white,
//                   filled: true,
//                   labelText: 'ओटीपी एंटर करा',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: BorderSide.none),
//                   floatingLabelBehavior: FloatingLabelBehavior.never,
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   _signInWithPhoneNumber();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   elevation: 5,
//                   backgroundColor: Color.fromARGB(255, 98, 53, 114),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(29),
//                     ),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
//                 ),
//                 child: Text(
//                   "ओटीपी सत्यापित करा",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 SizedBox(width: size.width * 0.28),
//                 Text(
//                   'खाते नाही? ',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     final User? user = _auth.currentUser;
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Login(
//                                 // arguments: User.uid,
//                               )),
//                     );
//                   },
//                   child: Text(
//                     'नोंदणी करा',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         );
//       }),
//     );
//   }

//   void _verifyPhoneNumber(BuildContext context) async {
//     final phoneExists =
//         await _checkIfPhoneNumberExists(_phoneNumberController.text);
//     if (!phoneExists) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Phone number not found in database')));
//       return;
//     }

//     verificationCompleted(AuthCredential phoneAuthCredential) async {
//       await _auth.signInWithCredential(phoneAuthCredential);
//       print('Received phone auth credential: $phoneAuthCredential');
//     }

//     verificationFailed(FirebaseAuthException authException) {
//       print(
//           'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
//     }

//     codeSent(String verificationId, int? forceResendingToken) {
//       print('Please check your phone for the verification code.');
//       _verificationId = verificationId;
//     }

//     codeAutoRetrievalTimeout(String verificationId) {
//       print("verification code: " + verificationId);
//     }

//     await _auth.verifyPhoneNumber(
//         phoneNumber: '+91${_phoneNumberController.text}',
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }

//   Future<bool> _checkIfPhoneNumberExists(String phoneNumber) async {
//     final snapshot = await _db
//         .collection('Dabbawala_user')
//         .where('phoneNumber', isEqualTo: phoneNumber)
//         .get();
//     return snapshot.docs.isNotEmpty;
//   }

//   void _signInWithPhoneNumber() async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: _smsController.text,
//       );
//       final User? user = (await _auth.signInWithCredential(credential)).user;
//       print('Successfully signed in UID:${user!.uid}');

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (buildcontext) => Navbarpage()),
//       );
//     } catch (e) {
//       print('Failed to sign in');
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/Navbarpage.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  late String _verificationId;
  final user = FirebaseAuth.instance.currentUser;
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 222, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 53, 114),
        title: Center(child: Text('लॉगिन', style: TextStyle(fontSize: 22))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: size.width * 0.82,
              child: TextFormField(
                controller: _phoneNumberController,
                // decoration: const InputDecoration(labelText: 'Phone number '),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'फोन नंबर',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  _verifyPhoneNumber(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Color.fromARGB(255, 98, 53, 114),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(29),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                child: Text(
                  "ओटीपी पाठवा",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            SizedBox(
              width: size.width * 0.82,
              child: TextFormField(
                controller: _smsController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'ओटीपी एंटर करा',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  _signInWithPhoneNumber();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Color.fromARGB(255, 98, 53, 114),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(29),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                ),
                child: Text(
                  "ओटीपी सत्यापित करा",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: size.width * 0.28),
                Text(
                  'खाते नाही? ',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    final User? user = _auth.currentUser;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login(
                                // arguments: User.uid,
                              )),
                    );
                  },
                  child: Text(
                    'नोंदणी करा',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
      ),
    );
  }

  void _verifyPhoneNumber(BuildContext context) async {
    final phoneExists =
        await _checkIfPhoneNumberExists(_phoneNumberController.text);
    if (!phoneExists) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone number not found in database')));
      return;
    }
    
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      print('Received phone auth credential: $phoneAuthCredential');
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      _verificationId = verificationId;
    } as PhoneCodeSent;

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("verification code: " + verificationId);
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
   Future<bool> _checkIfPhoneNumberExists(String phoneNumber) async {
    final snapshot = await _db
        .collection('Dabbawala_user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  void _signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsController.text,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;
      print('Successfully signed in UID: ${user!.uid}');
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (buildcontext) => Navbarpage()),
      );
    } catch (e) {
      print('Failed to sign in');
    }
  }
}
