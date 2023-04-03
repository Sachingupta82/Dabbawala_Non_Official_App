import 'package:flutter/material.dart';
//import 'package:flutterproject/screens/Splashscreen.dart';
//import 'package:flutterproject/screens/Homepage.dart';

import 'Homepage.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _number = '';
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: BorderSide.strokeAlignCenter,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: NetworkImage('https://mumbaidabbawala.in/wp-content/themes/dabbawala-theme/images/logo.png')),
                SizedBox(height: 60),
                TextFormField(
                  decoration: InputDecoration(labelText: 'मोबाईल नंबर'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'कृपया तुमचा ईमेल प्रविष्ट करा';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _number = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'कर्मचारी आयडी'),
                  validator: (value) {
  if (value!.isEmpty) {
                      return 'कृपया तुमचा कर्मचारी आयडी प्रविष्ट करा';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _id = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(alignment: Alignment.center,),
                  onPressed: () {
                    Navigator.push(
               context,
                              MaterialPageRoute(
                                builder: (context) =>Homepage(),
                              )
             );
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // You can perform sign up process here
                      // e.g. send data to server
                      print('Email: $_number, Password: $_id');
                    }
                  },
                  child: Text('लॉगिन'),
                   ),
              ],
            ),
          ),
        ),
     ),
);
}
}