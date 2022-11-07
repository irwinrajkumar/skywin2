import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'adminprofile.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:irwin/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'adminhome.dart';

// import 'package:irwin/redbus.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//   home: MyApp()));
// }
var baseurl = 'http://194.163.43.178:8000';
void loginapi(oldpassword, password, confirmpassword) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var name = pref.getString('id');
  var url = Uri.parse('$baseurl/changepassword/$name/');
  final response = await http.put(url, headers: <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded'
  }, body: {
    'old_password': oldpassword,
    'password': password,
    'confirm_password': confirmpassword,

    // 'email' : steffin13@gmail.com,
  });
  var data = json.decode(response.body);
  if (data['status'] == "success") {
    Get.offAll(() => login());
    Fluttertoast.showToast(msg: data['message']);
  } else {
    Fluttertoast.showToast(msg: data['message']);
  }
  print(response.body.toString());
}

TextEditingController oldpasswordcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController confirmpasswordcontroller = TextEditingController();

class adminchangepassword extends StatefulWidget {
  const adminchangepassword({Key? key}) : super(key: key);

  @override
  State<adminchangepassword> createState() => _adminchangepasswordState();
}

class _adminchangepasswordState extends State<adminchangepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 83, 83, 83),
          size: 40,
        ),
        backgroundColor: Color.fromARGB(255, 236, 235, 235),
        elevation: 0,
        // leading: Icon(Icons.),
        // leading: IconButton(
        // icon: Image(
        //     image: AssetImage(
        //   "assets/arrowback.png",
        // )),
        // onPressed: () {

        // }),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: ListView(children: [
          Container(
            child: Column(children: [
              Image.asset("assets/ChangePassword.png"),
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
            child: TextFormField(
              controller: oldpasswordcontroller,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Old Password',
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
            child: TextFormField(
              controller: passwordcontroller,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'New Password',
                  border: InputBorder.none),
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
            child: TextFormField(
              controller: confirmpasswordcontroller,
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
                    if (oldpasswordcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter old Password');
                    } else if (passwordcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter New Password');
                    }
                    //  else if (nameController.text != UserTypeController.text) {
                    //   Fluttertoast.showToast(msg: "Password did't match");
                    // }

                    // else if (mobileController.text.length != 10) {
                    //   Fluttertoast.showToast(msg: 'Enter Vaild Mobile Number');
                    // }
                    // else if (passwordController.text.isEmpty) {
                    //   Fluttertoast.showToast(msg: 'Enter Password');
                    // }
                    else if (confirmpasswordcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'ConfirmPassword');
                    }
                    // else if (passwordController.text != ConfirmPasswordController.text) {
                    //   Fluttertoast.showToast(msg: "Password did't match");
                    // }
                    else {
                      loginapi(
                          oldpasswordcontroller.text,
                          passwordcontroller.text,
                          confirmpasswordcontroller.text);
                      print(
                      oldpasswordcontroller.clear);
                      passwordcontroller.clear();
                      confirmpasswordcontroller.clear();
                      // totalamontController.clear();
                      // DateController.clear();
                      // NetweightController.clear();
                      
                    }
                  }))
        ]));
  }
}
