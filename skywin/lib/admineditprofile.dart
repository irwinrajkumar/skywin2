import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:irwin/adminhome.dart';
// import 'package:irwin/adminprofile.dart';
// import 'package:irwin/subdealerhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
var baseurl = 'http://194.163.43.178:8000';
void loginapi(username,editValue,mobile) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
    var userid=  pref.getString('id');
  var url = Uri.parse('$baseurl/editprofile/$userid/');
  final response = await http.put(url, headers: <String, String>{
    // 'Content-Type': 'application/x-www-form-urlencoded'
  }, body: {
    'username': username,
    'user_type': editValue,
    'mobile':mobile,

    // 'email' : steffin13@gmail.com,
  });
  var data = json.decode(response.body);
  if (data['status'] == "success") {
    var pref = await SharedPreferences.getInstance();
pref.setString('username', username);
      print(lastname);
    Get.to(() => adminhome());
    // Get.back();
    Fluttertoast.showToast(msg: data['message']);
  } else {
    Fluttertoast.showToast(msg:"faild");
  }
  print(response.body.toString());  
}

 

class admineditprofile extends StatefulWidget {
  const admineditprofile({Key? key}) : super(key: key);

  @override
  State<admineditprofile> createState() => _admineditprofileState();
}

class _admineditprofileState extends State<admineditprofile> {
 final List<String> edit = [
    'Admin',
    'sub dealer',
  ];
  String? editValue;

   TextEditingController usernamecontroller = TextEditingController();
  // TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Image(
                image: AssetImage(
              "assets/arrowback.png",
            )),
            onPressed: () {
              Navigator.pop(context);
            }),
        //  actions: [
        //   IconButton(
        //       icon: Image(image: AssetImage("assets/bell.png")),
        //       onPressed: () {}),
        // ],
      ),
      body:Padding(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: ListView(
        children: [
          Container(
            child: Column(children: [
              Image.asset("assets/mobilelogin.png"),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.circular(0)),
            height: 50,
            child:  TextFormField(
              controller: usernamecontroller,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Name',
                  border: InputBorder.none),
            ),
          ),

          SizedBox(height: 20),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("User type", style: TextStyle(fontSize: 20)
                // ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  // width: Get.width / 1.5,

                  height: 50,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          
                          SizedBox(
                            width: 4,
                          ),

                          // Expanded(
                          //   child: Text(
                          //     '  Maritial Status',
                          //     style: TextStyle(
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.grey,
                          //     ),
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                      items: edit
                          .map((payment) => DropdownMenuItem<String>(
                                value: payment,
                                child: Text(
                                  "  " + payment,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: editValue,
                      onChanged: (value) {
                        // setState(() {
                        //   weightValue = value as String;
                        //   isopen = true;
                        //   // iscolse=true;
                        // }
                        // );
                        setState(() {
                          editValue = value as String;
                          print(editValue.toString());
                          // isopen = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

// )
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.circular(0)),
            height: 50,
            child:  TextFormField(
              controller: mobilecontroller,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Mobile',
                  border: InputBorder.none),
                  keyboardType:TextInputType.number,
            ),
          ),
          SizedBox(
            height: 130,
          ),

          Container(
            height: 50,
            width: 10,
            padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
            child: RaisedButton(
              color: Color.fromARGB(255, 2, 228, 119),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onPressed: () {
                if (usernamecontroller.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Enter username');
                } else if (editValue.toString() == 'null') {
                                        Fluttertoast.showToast(
                                            msg: 'Enter usertype value');
                //  else if (nameController.text != UserTypeController.text) {
                //   Fluttertoast.showToast(msg: "Password did't match");
                }

                else if (mobilecontroller.text.length != 10) {
                  Fluttertoast.showToast(msg: 'Enter Vaild Mobile Number');
                }
                //  else if (passwordController.text.isEmpty) {
                //   Fluttertoast.showToast(msg: 'Enter Password');
                // } else if (ConfirmPasswordController.text.isEmpty) {
                //   Fluttertoast.showToast(msg: 'ConfirmPassword');
                // } else if (passwordController.text !=
                //     ConfirmPasswordController.text) {
                //   Fluttertoast.showToast(msg: "Password did't match");
                // } 
                else {
                  loginapi(
                      usernamecontroller.text,
                      editValue,
                      mobilecontroller.text,
                      
                      );
                      //  print(
                      // usernamecontroller.clear);
                      // mobilecontroller.clear();
                }

                // Navigator.pop(context);
                // print(usernamecontroller.text);
                // print(mobilecontroller.text);
                // print(UserTypeController.text);
               
              },
                // Navigator.push(context,MaterialPageRoute(builder: (context) => const adminhome()),);
               
  ))])));}
}
