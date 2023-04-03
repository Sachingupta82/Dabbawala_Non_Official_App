import 'package:flutter/material.dart';

class Customers extends StatefulWidget{
  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 80,
     ),
     
     body: Padding(
       padding: const EdgeInsets.all(50.0),
       child: Align(
        
       alignment: Alignment.topCenter,
       child: SizedBox(
         width: 130,
         height: 130,
         child: Image.network(
        'https://www.pngplay.com/wp-content/uploads/7/Customer-Logo-PNG-HD-Quality.png',
        fit: BoxFit.cover,
         ),
       ),
     ),
     ),
),);
  }
}