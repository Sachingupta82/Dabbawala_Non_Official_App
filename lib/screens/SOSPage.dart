import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumberCard extends StatelessWidget {
  final String phoneNumber;

  PhoneNumberCard({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 20.0),
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () => canLaunchUrl(Uri.parse("tel:${Uri.encodeComponent(phoneNumber)}")),
            )
          ],
        ),
      ),
    );
  }
}

class PhoneNumbersScreen extends StatelessWidget {
  final List<String> phoneNumbers = [    "9833369633",    "8291407855",    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Numbers"),
      ),
      body: ListView.builder(
        itemCount: phoneNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          return PhoneNumberCard(phoneNumber: phoneNumbers[index]);
        },
      ),
    );
  }
}
