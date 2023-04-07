import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login1.dart';
import 'loadingpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Login extends StatefulWidget {
  // const Login({super.key});
  String? uid;
  // final String arguments;
  
  // Login({super.key, required this.arguments});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final idController = TextEditingController();
  final addressController = TextEditingController();
   final TextEditingController _smsController = TextEditingController();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Dabbawala_user');
  
  



   @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    _selectedValue=null;
    super.dispose();
  }
  


File? _image;
late final String userId;
Future<void> getImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  });
}


String? _selectedValue;
String? docid;
File? Profilephoto;


// createNewDoc() {
//     DocumentReference newDocRef = usersCollection.doc(); // generates a new document ID
//     String newDocId = newDocRef.id;
//     // Do something with the new document ID
//   }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Object? uid = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      backgroundColor: Color.fromARGB(255, 98, 53, 114),
      title: Center(child: Text('लॉगिन',style: TextStyle(fontSize: 22))),
    ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 234, 222, 255),
      body:
    
      SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
//             StreamBuilder<DocumentSnapshot>(
              
//       stream: FirebaseFirestore.instance
//           .collection('Dabbawala_users')
//           .doc(createNewDoc())
//           .snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }

//         final data = snapshot.requireData;
// final boolValue = data.get('boolean_field');


//         if (boolValue) {
//           return const Homepage();
//         } else {
//           return const Login();
//         }
//       },
//     ),
            
            //column started
            SizedBox(height: size.height * 0.01),
            
            CircleAvatar(
              radius:52,
              backgroundColor: Colors.black,
              child: GestureDetector(
                onTap: getImage,
                child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : AssetImage('images/dabba.png') as ImageProvider<Object>?,
                ),
              ),
            ),
            
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                
                children: [
                  SizedBox(height: 50),
                  
                  SizedBox(
                    width: size.width*0.82,
                    child: TextFormField(
                      
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'नाव आवश्यक आहे';
                        }
                        return null;
                      },
                      cursorHeight: 25,
                      textAlign: TextAlign.start,
                      // validator: (value) => ,
                      decoration: InputDecoration(
                        label: Text("नाव"),
                        prefixIcon: Icon(Icons.person),

                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none
                        ),
                        fillColor: Color.fromARGB(225, 255, 252, 252),
                        // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                
                  SizedBox(
                    width: size.width*0.82,
                    child: TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'फोन नंबर आवश्यक आहे';
                        } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'अवैध फोन नंबर';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      cursorHeight: 25,
                      cursorWidth: 3,
                      // cursorColor: Colors.black,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        label: Text('फोन नंबर '),
                        prefixIcon: Icon(Icons.phone),

                        filled: true,
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none
                        ),
                        fillColor: Color.fromARGB(225, 255, 252, 252),
                        // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),


                  SizedBox(height: size.height * 0.03),
                
                  SizedBox(
                    width: size.width*0.82,
                    child: TextFormField(
                      controller: idController,
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'नाव आवश्यक आहे';
                        }
                        return null;
                      },
                      cursorHeight: 25,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        label: Text('कर्मचारी आयडी'),
                        prefixIcon: Icon(Icons.numbers),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15.0),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none
                        ),
                        fillColor: Color.fromARGB(225, 255, 252, 252),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  
                Container(
                  width: size.width*0.8,
                  height: size.height*0.072,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color:Color.fromARGB(225, 255, 252, 252),
                  borderRadius: BorderRadius.circular(30),
                  //border: Border.all(color: Color.fromARGB(255, 250, 248, 248)),
                ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'तुमचे क्षेत्र निवडा',
                      prefixIcon: Icon(Icons.location_on),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        
                      )
                      
                    ),
                    value: _selectedValue,
                    iconEnabledColor: Colors.black,
                    icon: Icon(Icons.arrow_drop_down),
                    
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          'दादर',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Dadar",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'परभादवी',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Prabhadevi",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'मुंबई सेंट्रल',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "mumbai central",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'ग्रांट रोड',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Grant road",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'अंधेरी',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Andheri",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'बोरिवली',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Borivali",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'वशी',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Vashi",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'माहीम',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Mahim",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'कुर्ला',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Kurla",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'मुलुंड',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Mulund",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'खार रोड',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Khar road",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'लोअर परळ',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Lower Parel",
                      ),

                      DropdownMenuItem(
                        child: Text(
                          'परळ',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Parel",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'वांद्रे',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Bandra",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'चर्चगेट',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Churchgate",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'मशीद बंदर',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Masjid Bunder",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'भायखळा',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Byculla",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'चिंचपोकळी',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Chinchpokli",
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

                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue ;
                      });
                    },
                  ),
                
              ),
                

                  SizedBox(height: size.height * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        _register();
                        
                        
                       Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => loadingpage(
                                // arguments: User.uid,
                              )),
                    );
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Color.fromARGB(255, 98, 53, 114),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(29),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          ),
                    ),
                    child: const Text(
                      'लॉगिन',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 245, 242, 241),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PhoneAuthPage()),
    );
                        },
                        child: Text(
                          'Back to Login',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  void _register() async {
  final String phoneNumber = '+91${phoneController.text.trim()}';
  final Map<String, dynamic> user = {
    'name': nameController.text.trim(),
    'phoneNumber': phoneNumber,
    'employeeId': idController.text.trim(),
    'location': _selectedValue,
    'boolean_field' : 'false',
    'Profilephoto' : _image?.path,
    // Add selected location value to Firestore document
  };
  // final result = await usersCollection.add(user);
  final uid = FirebaseAuth.instance.currentUser?.uid;
//   if (uid != null) {
//   // Store user information with the uid
// } else {
//   // Handle the case where the uid is null
// }

  await FirebaseFirestore.instance.collection('Dabbawala_user').doc(user['uid']).set(user);
 
  // add other fields here
  }



  // docid = {result.id} as String?;
  }// print(docid);
  // print('New user added with ID: ${result.id}');

