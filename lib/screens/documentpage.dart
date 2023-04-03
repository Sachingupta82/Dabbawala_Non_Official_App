import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notification.dart';

class DocumentPage extends StatefulWidget {
  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  bool _isUrgent = false;
  bool _isNotUrgent = false;
  String? _selectedValue= 'select';

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
          body: SingleChildScrollView(
            child: Column(
              children: [
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
                    elevation: 4,
                    dropdownColor: Color.fromARGB(255, 234, 222, 255),
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
                          'दस्तऐवज निवडा',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "select",
                      ),
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
                      DropdownMenuItem(
                        child: Text(
                          'वेतन प्रमाणपत्र',
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "Salary Certificate",
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
                  backgroundColor: Color(0xFF4e0064),
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
