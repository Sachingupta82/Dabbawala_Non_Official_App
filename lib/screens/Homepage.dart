import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: size.width * 3.0,
                        height: size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0)),
                          color: Color.fromARGB(255, 11, 5, 5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                                radius: 60,
                              ),
                              title: Text(
                                'नमस्कार रितेश',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              subtitle: Text(
                                'तांत्रिक प्रमुख',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              trailing: Icon(Icons.notifications,
                                  size: 30, color: Colors.white),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          color: Color.fromARGB(255, 215, 229, 215),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: size.width * 1.0,
                            height: size.height * 0.62,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 24,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                                              radius: 22,
                                            ),
                                          ),
                                          title: Text('Ritesh'),
                                          subtitle: Text('wadala'),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: NetworkImage(
                                          'https://cdn.zeebiz.com/sites/default/files/2016/12/27/11740-godrej-appliances-presenting-customised-cycles-fitted-with-chotukool-to-mumbai-dabbawala-association.JPG'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'भारतीय उत्पादक आणि गृह उपकरणे ब्रँड, गोदरेजने मंगळवारी #UnHungryIndia मोहिमेचा एक भाग म्हणून त्यांच्या रोटीबँक उपक्रमाला पाठिंबा देण्यासाठी मुंबईच्या डब्बावाला असोसिएशनसोबत भागीदारीची घोषणा केली.',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30,top: 7),
                                      
                                      child: Row(
                                        children: [
                                          Icon(Icons.thumb_up_alt_rounded),
                                          SizedBox(width: size.width*0.1),
                                          Icon(Icons.share),

                                          SizedBox(width: size.width*0.32),

                                          Text('4 hours ago')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.018),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          color: Color.fromARGB(255, 215, 229, 215),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: size.width * 1.0,
                            height: size.height * 0.62,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 24,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                                              radius: 22,
                                            ),
                                          ),
                                          title: Text('Ritesh'),
                                          subtitle: Text('wadala'),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: NetworkImage(
                                          'https://ichef.bbci.co.uk/news/976/mcs/media/images/72887000/jpg/_72887949_img_2721.jpg'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'दररोज, मुंबईतील डब्बेवाले ताजे बनवलेले जेवणाचे सुमारे 200,000 टिफिन बॉक्स शहरातील कार्यालयांपर्यंत पोहोचवतात. सात्यकी घोष यांनी या अत्यंत संघटित व्यापाराचे दस्तऐवजीकरण केले जे एका शतकाहून अधिक काळापासून शहराचे वैशिष्ट्य आहे.',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30,top: 7),
                                      
                                      child: Row(
                                        children: [
                                          Icon(Icons.thumb_up_alt_rounded),
                                          SizedBox(width: size.width*0.1),
                                          Icon(Icons.share),

                                          SizedBox(width: size.width*0.32),

                                          Text('8 hours ago')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      SizedBox(height: size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          color: Color.fromARGB(255, 215, 229, 215),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: size.width * 1.0,
                            height: size.height * 0.62,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 24,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                                              radius: 22,
                                            ),
                                          ),
                                          title: Text('Ritesh'),
                                          subtitle: Text('wadala'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height*0.4,
                                      child: Image(
                                        image: NetworkImage(
                                            'https://luxebook.in/wp-content/uploads/2019/06/Dabbawala_ENGLISH_Oct2018_Lr_Page_01.jpg'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30,top: 50),
                                      
                                      child: Row(
                                        children: [
                                          Icon(Icons.thumb_up_alt_rounded),
                                          SizedBox(width: size.width*0.1),
                                          Icon(Icons.share),

                                          SizedBox(width: size.width*0.32),

                                          Text('1 day ago')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      SizedBox(height: size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          color: Color.fromARGB(255, 215, 229, 215),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: size.width * 1.0,
                            height: size.height * 0.62,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 24,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://cdn.dribbble.com/users/612255/screenshots/2607320/media/62e4e83388bfbd18596b59db62d4733c.png?compress=1&resize=400x300'),
                                              radius: 22,
                                            ),
                                          ),
                                          title: Text('Ritesh'),
                                          subtitle: Text('wadala'),
                                        ),
                                      ],
                                    ),
                                    // Image(
                                    //   image: NetworkImage(
                                    //       'https://cdn.zeebiz.com/sites/default/files/2016/12/27/11740-godrej-appliances-presenting-customised-cycles-fitted-with-chotukool-to-mumbai-dabbawala-association.JPG'),
                                    // ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'भारतीय उत्पादक आणि गृह उपकरणे ब्रँड, गोदरेजने मंगळवारी #UnHungryIndia मोहिमेचा एक भाग म्हणून त्यांच्या रोटीबँक उपक्रमाला पाठिंबा देण्यासाठी मुंबईच्या डब्बावाला असोसिएशनसोबत भागीदारीची घोषणा केली.',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30,top: 10),
                                      
                                      child: Row(
                                        children: [
                                          Icon(Icons.thumb_up_alt_rounded),
                                          SizedBox(width: size.width*0.1),
                                          Icon(Icons.share),

                                          SizedBox(width: size.width*0.32),

                                          Text('2 day ago')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.1),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
