import 'dart:io';

import 'package:flutter/material.dart';
import 'loadingpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';






class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final idController = TextEditingController();
  final addressController = TextEditingController();
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Dabbawala_user');

   @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    _selectedValue=null;
    super.dispose();
  }
  


// File? _image;

// Future<void> getImage() async {
//   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

//   setState(() {
//     if (pickedFile != null) {
//       _image = File(pickedFile.path);
//     } else {
//       print('No image selected.');
//     }
//   });
// }
String? _selectedValue;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(255, 234, 222, 255),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              //column started
              SizedBox(height: size.height * 0.1),
              // Text('𝕸𝖚𝖒𝖇𝖆𝖎 𝕯𝖆𝖇𝖇𝖆𝖜𝖆𝖑𝖆',style: TextStyle(fontSize: 35),),
              Image.network('https://mumbaidabbawala.in/wp-content/themes/dabbawala-theme/images/logo.png',width: size.width * 0.60),

              // CircleAvatar(
              //   radius:52,
              //   backgroundColor: Colors.black,
              //   child: GestureDetector(
              //     onTap: getImage,
              //     child: CircleAvatar(
              //     radius: 50,
              //     backgroundImage: _image != null ? FileImage(_image!) : null,
              //     child: _image == null ? Icon(Icons.person) : null,
              //     ),
              //   ),
              // ),
              // Image.asset("images/cycle.png", width: 170, height: 120),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    // Row(
                    //   children: [
                    //     SizedBox(width: 30),
                    //     Text(
                    //       'नाव :',
                    //       style: TextStyle(fontSize: 30),
                    //     ),
                    //   ],
                    // ),
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
                    
                    // Row(
                    //   children: [
                    //     SizedBox(width: 20),
                    //     Text(
                    //       'फोन नंबर :',
                    //       style: TextStyle(fontSize: 30),
                    //     ),
                    //   ],
                    // ),
                    
                    
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
                        keyboardType: TextInputType.number,
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
                    
                    
                    // Row(
                    //   children: [
                    //     SizedBox(width: 20),
                    //     Text(
                    //       'कर्मचारी आयडी :',
                    //       style: TextStyle(fontSize: 30),
                    //     ),
                    //   ],
                    // ),
                    
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
                    
                    // Row(
                    //   children: [
                    //     SizedBox(width: 20),
                    //     Text(
                    //       'पत्ता :',
                    //       style: TextStyle(fontSize: 30),
                    //     ),
                    //   ],
                    // ),


                    // SizedBox(
                    //   width: size.width*0.82,
                    //   child: TextFormField(
                        
                    //     controller: addressController,
                    //      validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return ' आवश्यक आहे';
                    //       }
                    //       return null;
                    //     },
                    //     // controller: TextEditingController.fromValue(value),
                    //     cursorHeight: 25,
                    //     textAlign: TextAlign.start,
                    //     decoration: InputDecoration(
                    //       label: Text('पत्ता'),
                    //       prefixIcon: Icon(Icons.home),
                    //       contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    //       filled: true,
                          
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30.0),
                    //         borderSide: BorderSide.none
                    //       ),
                    //       fillColor: Color.fromARGB(225, 255, 252, 252),
                    //       // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                        
                    //   ),
                    // ),
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
                        _selectedValue = newValue as String?;
                      });
                    },
                  )

                ),
                  



                    SizedBox(height: size.height * 0.05),
                    ElevatedButton(
                      onPressed: () {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          _register();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loadingpage(),
                            ),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
  final Map<String, dynamic> user = {
    'name': nameController.text.trim(),
    'phoneNumber': phoneController.text.trim(),
    'employeeId': idController.text.trim(),
    'location': _selectedValue, // Add selected location value to Firestore document
  };
  final result = await usersCollection.add(user);
  print('New user added with ID: ${result.id}');
}

}
