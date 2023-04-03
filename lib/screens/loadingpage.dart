import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Navbarpage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class loadingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 222, 255),
        body: Center(
          child: Column(children: [
            SizedBox(height: 250),
            // Image.asset("images/cycle.png", width: 170, height: 120),
            LoadingAnimationWidget.flickr(
              size: 150,
              leftDotColor: Colors.black,
              rightDotColor: Colors.white,
            ),
            Text(
              'कृपया प्रशासन तुमची विनंती मान्य करेपर्यंत प्रतीक्षा करा',
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 60),

            ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Navbarpage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Color(0xFF4e0064),
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
                          ),
                      ),
                      child: const Text(
                        'Enter',
                        style: TextStyle(
                         color: Color.fromARGB(255, 245, 242, 241),
                        ),
                      ),
                    ),
          ]),
        ),
      ),
    );
  }
}
