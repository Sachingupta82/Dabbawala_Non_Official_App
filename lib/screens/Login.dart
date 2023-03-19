import 'package:flutter/material.dart';
import 'loadingpage.dart';
import 'package:google_fonts/google_fonts.dart';

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


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(255, 215, 229, 215),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              //column started
              SizedBox(height: size.height * 0.03),

              CircleAvatar(
                radius:52,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                ),
              ),
              // Image.asset("images/cycle.png", width: 170, height: 120),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'नाव :',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 380,
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
                          prefixIcon: Icon(Icons.person),

                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fillColor: Colors.white,
                          // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    
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
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fillColor: Colors.white,
                          // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                        ),
                      ),
                    ),


                    SizedBox(height: size.height * 0.03),
                    
                    
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
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fillColor: Colors.white,
                          // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'पत्ता :',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),


                    SizedBox(
                      width: 380,
                      child: TextFormField(
                        
                        controller: addressController,
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' आवश्यक आहे';
                          }
                          return null;
                        },
                        // controller: TextEditingController.fromValue(value),
                        cursorHeight: 25,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 15.0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fillColor: Colors.white,
                          // label:  Text('नाव',style: TextStyle(fontSize: 40),),
                        ),
                      ),
                    ),


                    SizedBox(height: size.height * 0.05),
                    ElevatedButton(
                      onPressed: () {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
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
                        backgroundColor: Colors.black,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Cormorant Garamond'),
                      ),
                      child: const Text(
                        'लॉगिन',
                        style: TextStyle(
                          color: Color.fromARGB(255, 247, 247, 245),
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
}
