// import 'package:flutter/material.dart';

// class showdropdown extends StatefulWidget{
//   @override
//   State<showdropdown> createState() => _showdropdownState();
// }

// class _showdropdownState extends State<showdropdown> {
//   String? _selectedValue;

//    @override
//   Widget build(BuildContext context)
//   {
//     return DropdownButtonFormField(
//                     decoration: InputDecoration(
//                       labelText: 'तुमचे क्षेत्र निवडा',
//                       prefixIcon: Icon(Icons.location_on),
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
                        
//                       )
                      
//                     ),
//                     value: _selectedValue,
//                     iconEnabledColor: Colors.black,
//                     icon: Icon(Icons.arrow_drop_down),
                    
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                     items: const [
//                       DropdownMenuItem(
//                         child: Text(
//                           'दादर',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Dadar",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'परभादवी',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Prabhadevi",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'मुंबई सेंट्रल',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "mumbai central",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'ग्रांट रोड',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Grant road",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'अंधेरी',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Andheri",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'बोरिवली',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Borivali",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'वशी',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Vashi",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'माहीम',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Mahim",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'कुर्ला',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Kurla",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'मुलुंड',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Mulund",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'खार रोड',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Khar road",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'लोअर परळ',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Lower Parel",
//                       ),

//                       DropdownMenuItem(
//                         child: Text(
//                           'परळ',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Parel",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'वांद्रे',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Bandra",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'चर्चगेट',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Churchgate",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'मशीद बंदर',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Masjid Bunder",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'भायखळा',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Byculla",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'चिंचपोकळी',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Chinchpokli",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'उत्पन्नाचा दाखला',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Income",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'अनुभव पत्र',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Experience letter",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'उत्पन्नाचा दाखला',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Income",
//                       ),
//                       DropdownMenuItem(
//                         child: Text(
//                           'अनुभव पत्र',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         value: "Experience letter",
//                       ),

//                     ],
//                     onChanged: (newValue) {
//                       setState(() {
//                         _selectedValue = newValue as String?;
//                       });
//                     },
//                   );
//   }
// }