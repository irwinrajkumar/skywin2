import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'adminhome.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// import 'adminprofile.dart';
// import 'main.dart';
// import 'subdealerlist.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:async';

var baseurl = 'http://194.163.43.178:8000';
void loginapi(name, userValue, mobile, password, confirmpassword) async {
  var url = Uri.parse('$baseurl/addUser/');
  final response = await http.post(url, headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
    // 'x-api-key': 'yogi@123'
  }, body: {
    'username': name,
    'user_type': userValue,
    'mobile': mobile,
    'password': password,
    'confirm_password': confirmpassword
  });
  var data = json.decode(response.body);
  if(
    response.statusCode == 200
  )
  {
   var pref=await SharedPreferences.getInstance();
   pref.setString('id', data['data']['id'].toString());  
    final body = jsonDecode(response.body);
    print("login Token"+body.toString());
  }else{
    print("Invalid Credintials");
  }

  if (data['status'] == 'success') {
    Get.offAll(() => adminhome());
    Fluttertoast.showToast(msg: data['message']);
  } else {
    Fluttertoast.showToast(msg: data['message']);
  }
  print(response.body.toString());
}

class adduser extends StatefulWidget {
  const adduser({Key? key}) : super(key: key);

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 235, 235),
        elevation: 0,
        leading: IconButton(
            icon: Image(
                image: AssetImage(
              "assets/arrowback.png",
            )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const adminhome()),
              );
            }),
        //  actions: [
        //   IconButton(
        //       icon: Image(image: AssetImage("assets/bell.png")),
        //       onPressed: () {}),
        // ],
      ),
      body: bodypart(),
    );
  }
}

class bodypart extends StatefulWidget {
  const bodypart({Key? key}) : super(key: key);

  @override
  State<bodypart> createState() => _bodypartState();
}

class _bodypartState extends State<bodypart> {
  TextEditingController nameController = new TextEditingController();
  // TextEditingController UserTypeController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController ConfirmPasswordController = new TextEditingController();
  final List<String> user = [
    'Admin',
    'sub dealer',
  ];
  String? userValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView(
        children: [
          Container(
            // height: 600,
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
            child: TextField(
              controller: nameController,
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
          SizedBox(
            height: 20,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 199, 196, 196),
          //       borderRadius: BorderRadius.circular(0)),
          //   height: 50,
          //   child: TextField(
          //     controller: UserTypeController,
          //     // obscureText: true,
          //     decoration: InputDecoration(
          //         fillColor: Color.fromARGB(255, 247, 245, 245),
          //         filled: true,
          //         // border: OutlineInputBorder(
          //         //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),

          //         hintText: 'User Type',
          //         border: InputBorder.none),
          //   ),
          // ),
          SizedBox(height: 5),
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
                      items: user
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
                      value: userValue,
                      onChanged: (value) {
                        // setState(() {
                        //   weightValue = value as String;
                        //   isopen = true;
                        //   // iscolse=true;
                        // }
                        // );
                        setState(() {
                          userValue = value as String;
                          print(userValue.toString());
                          // isopen = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 5),
          // Container(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Text("User type", style: TextStyle(fontSize: 20)
          //       // ),
          //       SizedBox(
          //         height: 0,
          //       ),
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 252, 251, 251),
          //           borderRadius: BorderRadius.circular(0),
          //         ),
          //         // width: Get.width / 1.5,

          //         height: 50,
          //         // child: DropdownButtonHideUnderline(
          //         //   child: DropdownButton2(
          //         //     isExpanded: true,
          //         //     hint: Row(
          //         //       children: const [
                          
          //         //         SizedBox(
          //         //           width: 4,
          //         //         ),

          //         //         // Expanded(
          //         //         //   child: Text(
          //         //         //     '  Maritial Status',
          //         //         //     style: TextStyle(
          //         //         //       fontSize: 18,
          //         //         //       fontWeight: FontWeight.bold,
          //         //         //       color: Colors.grey,
          //         //         //     ),
          //         //         //     overflow: TextOverflow.ellipsis,
          //         //         //   ),
          //         //         // ),
          //         //       ],
          //         //     ),
          //         //     items: user
          //         //         .map((payment) => DropdownMenuItem<String>(
          //         //               value: payment,
          //         //               child: Text(
          //         //                 "  " + payment,
          //         //                 style: const TextStyle(
          //         //                     fontWeight: FontWeight.bold,
          //         //                     color: Colors.grey,
          //         //                     fontSize: 18),
          //         //                 overflow: TextOverflow.ellipsis,
          //         //               ),
          //         //             ))
          //         //         .toList(),
          //         //     value: userValue,
          //         //     onChanged: (value) {
          //         //       // setState(() {
          //         //       //   weightValue = value as String;
          //         //       //   isopen = true;
          //         //       //   // iscolse=true;
          //         //       // }
          //         //       // );
          //         //       setState(() {
          //         //         userValue = value as String;
          //         //         print(userValue.toString());
          //         //         // isopen = true;
          //         //       });
          //         //     },
          //         //   ),
          //         // ),
          //       ),
          //     ],
          //   ),
          // ),
            
          
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.circular(0)),
            height: 50,
            child: TextField(
              controller: mobileController,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Moblie',
                  border: InputBorder.none),
                  keyboardType:TextInputType.number,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.circular(0)),
            height: 50,
            child: TextField(
              controller: passwordController,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Password ',
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.circular(0)),
            height: 50,
            child: TextField(
              controller: ConfirmPasswordController,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Confirm Password',
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 10,
            padding: EdgeInsets.fromLTRB(110, 0, 110, 0),
            child: RaisedButton(
              color: Color.fromARGB(255, 2, 228, 119),
              child: Text(
                'Add User',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onPressed: () {
                if (nameController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Enter Name');
                } else if (userValue.toString() == 'null') {
                                        Fluttertoast.showToast(
                                            msg: 'Enter value');
                //  else if (nameController.text != UserTypeController.text) {
                //   Fluttertoast.showToast(msg: "Password did't match");
                }

                else if (mobileController.text.length != 10) {
                  Fluttertoast.showToast(msg: 'Enter Vaild Mobile Number');
                } else if (passwordController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Enter Password');
                } else if (ConfirmPasswordController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'ConfirmPassword');
                } else if (passwordController.text !=
                    ConfirmPasswordController.text) {
                  Fluttertoast.showToast(msg: "Password did't match");
                } else {
                  loginapi(
                      nameController.text,
                      userValue,
                      mobileController.text,
                      passwordController.text,
                      ConfirmPasswordController.text);
                }

                Navigator.pop(context);
                print(nameController.text);
                print(passwordController.text);
                // print(UserTypeController.text);
                print(mobileController.text);
                print(ConfirmPasswordController.text);
              },
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
