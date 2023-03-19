import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login.dart';

class Login1 extends StatefulWidget {
  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey,
            body: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'फोन नंबर :',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  width: 380,
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
                      prefixIcon: Icon(Icons.phone),
            
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      fillColor: Colors.white,
                      // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                    ),
                  ),
                ),
                Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'कर्मचारी आयडी :',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              
              SizedBox(
                width: 380,
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
                    prefixIcon: Icon(Icons.numbers),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 15.0),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    fillColor: Colors.white,
                    // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(children: [
                Text('नोंदणीकृत वापरकर्ता नाही?'),
                TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: TextButton.styleFrom(
                
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
              ),
              child: const Text(
                'नोंदणी करा',
                style: TextStyle(
                  color: Color.fromARGB(255, 18, 16, 1),
                ),
              ),
            ),
              ],)
              ],
            )),
      ),
    );
  }
}
