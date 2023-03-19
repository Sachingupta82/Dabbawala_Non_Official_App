import 'package:flutter/material.dart';

class DocumentPage extends StatefulWidget {
  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  bool _isUrgent = false;
  bool _isNotUrgent = false;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width * 1.0,
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
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        subtitle: Text(
                          'तांत्रिक प्रमुख',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        trailing:Icon(Icons.notifications,size: 30,color: Colors.white),
                      ),
                    ]),
                  ),
                ),

                SizedBox(
                  width: size.width * 3.0,
                  child: Image(
                    image: AssetImage('images/docs.png'),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButton(
                    value: _selectedValue,
                    iconEnabledColor: Colors.black,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          'उत्पन्नाचा दाखला',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Income",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'अनुभव पत्र',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Experience letter",
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue as String?;
                      });
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                CheckboxListTile(
                  title: Text(
                    "जलद",
                    style: TextStyle(fontSize: 25),
                  ),
                  value: _isUrgent,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _isUrgent = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.black,
                  title: Text(
                    "जलद नाही",
                    style: TextStyle(fontSize: 25),
                  ),
                  value: _isNotUrgent,
                  onChanged: (value) {
                    setState(() {
                      _isNotUrgent = value!;
                    });
                  },
                ),
                SizedBox(height: size.height * 0.03),
                FloatingActionButton.extended(
                  label: Text(
                    'विनंती करतोये',
                    style: TextStyle(fontSize: 18),
                  ),
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.send_to_mobile,
                    size: 24.0,
                  ),
                  onPressed: () {
                    //  Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
