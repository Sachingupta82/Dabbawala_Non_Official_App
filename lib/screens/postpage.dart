import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notification.dart';
import 'package:image_picker/image_picker.dart';

class postpage extends StatefulWidget {
  // final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  const postpage({Key? key}) : super(key: key);
  @override
  State<postpage> createState() => _postpageState();
}

class _postpageState extends State<postpage> {
  final _formKey = GlobalKey<FormState>();
  final _postController = TextEditingController();
  File? _image;
  bool _isUploading = false;
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('Dabbawala_user');

  String _userName = '';
  String name = '';
  String location = '';
  String profilePhotoPath = '';
  

  void getUserData() async {
    final phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;

    if (phoneNumber != null) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Dabbawala_user')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        setState(() {
          name = userData['name'];
          location = userData['location'];
          profilePhotoPath = userData['Profilephoto'];
        });

        //   print('Name: $name');
        //   print('Location: $location');
        //   print('Profile Photo Path: $profilePhotoPath');
        // } else {
        //   print('No user found with the given phone number');
        // }
      } else {
        print('Nothing working');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }


  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File file) async {
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('post_images')
          .child(DateTime.now().toString());
      final task = ref.putFile(file);
      final snapshot = await task.whenComplete(() {});
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }

  void _submitPost() async {
    final postContent = _postController.text;

    setState(() {
      _isUploading = true;
    });

    final imageUrl = _image != null ? await _uploadImage(_image!) : null;
    

    try {
      await FirebaseFirestore.instance.collection('posts').add({
        'content': postContent,
        'imageUrl': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
        'username': name,
        
      });
      _formKey.currentState?.reset();
      setState(() {
        _image = null;
        _postController.clear();
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 234, 222, 255),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 98, 53, 114),
              leading: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 8, top: 10, bottom: 1, right: 0),
                  child:  CircleAvatar(
                    backgroundImage:  NetworkImage(
                        'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300',
                  ),
                    // Image.file(File(profilePhotoPath)).image,
                  ),
                ),
              ),
              title: Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.fromLTRB(50, 30, 30, 20),
                child: Column(
                  children: [
                    // SizedBox(height: size.height*0.01),
                     Text("नमस्कार $name",
                      style: TextStyle(fontSize: 23),
                    ),
                    Text(
                      '$location',
                      style: TextStyle(fontSize: 16,fontWeight:FontWeight.normal ),
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
          resizeToAvoidBottomInset: false,
          body: _isUploading
              ? Center(child: CircularProgressIndicator())
              : Form(
                  key: _formKey,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_image != null)
                          Image.file(
                            _image!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 30, 10, 10),
                          child: Row(
                            children: [
                              FloatingActionButton.extended(
                                heroTag: "bt1",
                                label: Text(
                                  'फोटो घ्या',
                                  style: TextStyle(fontSize: 18),
                                ),
                                backgroundColor: Color(0xFF4e0064),
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 24.0,
                                ),
                                
                                  onPressed:() => _getImage(ImageSource.camera),
                                  //  Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage()));
                                
                              ),
                              SizedBox(width: 5),
                              FloatingActionButton.extended(
                                heroTag: "bt2",
                                label: Text(
                                  'फोटो निवडा',
                                  style: TextStyle(fontSize: 18),
                                ),
                                backgroundColor: Color(0xFF4e0064),
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20.0,
                                ),
                                  onPressed:() => _getImage(ImageSource.gallery),
                                  //  Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage()));
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _postController,
                          decoration: InputDecoration(
                            hintText: 'What\'s happening?',
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your post content.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height*0.04),
                        
                           // button text
                        OutlinedButton(
                          
                          
                           onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _submitPost();
                            }
                          },
                          child: Text('पोस्ट',style: TextStyle(fontSize: 30),),
                        ),
                      ]),
                ),
        ),
      ),
    );
  }
}
