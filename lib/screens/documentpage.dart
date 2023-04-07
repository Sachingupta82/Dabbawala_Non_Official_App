import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notification.dart';

class DocumentPage extends StatefulWidget {
  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  bool _isUrgent = false;
  bool _isNotUrgent = false;
  String? _selectedValue= 'select';
  bool? _urgency ;
  String _userName = '';
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
                    // Image.file(File(profilePhotoPath)).image,
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
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 234, 222, 255),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 3.0,
                  child: Image(
                    image: AssetImage('images/docs.png'),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    
                  ),
                  child: DropdownButton(
                    elevation: 4,
                    dropdownColor: Color.fromARGB(255, 234, 222, 255),
                    value: _selectedValue,
                    iconEnabledColor: Colors.black,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          'दस्तऐवज निवडा',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "select",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'उत्पन्नाचा दाखला',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Income",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'अनुभव पत्र',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Experience letter",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'वेतन प्रमाणपत्र',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Salary Certificate",
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue ;
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                RadioListTile(
                  title: Text(
                    "जलद",
                    style: TextStyle(fontSize: 25),
                  ),
                  value: false,
                  groupValue: _urgency,
                  onChanged: (value) {
                    setState(() {
                      _urgency = false;
                    });
                  },
                ),
                RadioListTile(
                  title: Text(
                    "जलद नाही",
                    style: TextStyle(fontSize: 25),
                  ),
                  value: true,
                  groupValue: _urgency,
                  onChanged: (value) {
                    setState(() {
                      _urgency = true;
                    });
                  },
                ),

                SizedBox(height: size.height * 0.03),
                FloatingActionButton.extended(
                  label: Text(
                    'विनंती करतोये',
                    style: TextStyle(fontSize: 18),
                  ),
                  backgroundColor: Color(0xFF4e0064),
                  icon: Icon(
                    Icons.send_to_mobile,
                    size: 24.0,
                  ),
                  

    onPressed: () async {
  final phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;

  if (_selectedValue != 'select' && _urgency != null && phoneNumber != null) {
    await FirebaseFirestore.instance.collection('documents').add({
      'documentType': _selectedValue,
      'urgency': _urgency,
      'userName': name,
      'phoneNumber': phoneNumber,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Show a success message
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('यश संदेश'),
        content: Text('तुमची विनंती पाठवली आहे'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ठीक आहे'),
          ),
        ],
      ),
    );

    // Clear the form values
    setState(() {
      _selectedValue = 'select';
      _urgency = null;
    });
  } else {
    // Show an error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('कृपया कोणताही एक पर्याय निवडा')),
    );
  }
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
