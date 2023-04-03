import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notification.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  List posts = [];
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
                  ),
                ),
              ),
              title: Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                child: Column(
                  children: [
                    // SizedBox(height: size.height*0.01),
                    Text(
                      'नमस्कार रितेश',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'तांत्रिक प्रमुख',
                      style: TextStyle(fontSize: 16),
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
          
          // ),
        body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').orderBy('timestamp',descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final post = snapshot.data!.docs[index];

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(  
                        borderRadius: BorderRadius.circular(15.0),  
                      ), 
                  elevation: 0,
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      if (post['imageUrl'] != null)
                      Image.network(
                          post['imageUrl'],
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['content'],
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    post['timestamp'].toDate().toString(),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
                          ),
                      ),
                    ],
                  ),
                ),
              );
              
            },
          );
        },
      ),
        ),
      ),
        );
  }
}
