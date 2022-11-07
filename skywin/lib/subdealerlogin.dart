// ignore_for_file: unused_import
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:irwin/adminhome.dart';
import 'package:get/get.dart';
import 'package:irwin/subdealerhome.dart';

// import 'home.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import 'package:another_flushbar/flushbar.dart';

// import 'package:irwin/adduser.dart';
// import 'dart:convert'; 

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

import 'adminhome.dart';
// import 'forget page.dart';
// import 'home.dart';
// import 'package:sizer/sizer.dart';

// import 'dart:async';


// void main() => runApp(login());

void main(List<String> args) {
  runApp( GetMaterialApp(
    home: login1(),
    debugShowCheckedModeBanner: false,
  ));
}


//   var baseurl = 'http://194.163.43.178:8000';
// void loginapi(mobile, password) async {
//   var url = Uri.parse('$baseurl/login/');
//   final response = await http.post(url, headers: <String, String>{
//     'Content-Type': 'application/x-www-form-urlencoded'
//   }, body: {
//     'mobile': mobile,
//     'password': password,

  
//   });
//   var data = json.decode(response.body);
  
//   if (data['status'] == "success") {
//      SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('id', data['data']['id'].toString());
//     chkuser(data['data']['id']);
//     // Get.offAll(() => home());  
//     Fluttertoast.showToast(msg: data['message']);
//   } else {
//     Fluttertoast.showToast(msg: data['message']);
//   }
//   print(response.body.toString());  
// }
// void chkuser(id) async {
//   var url = Uri.parse('$baseurl/addUser/$id');
//   final response = await http.get(url, 
//   );
//   var data = json.decode(response.body);
  
//  SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('id', data['data']['id'].toString());
//   if (data['data']['user_type'] == "sub dealer") {
//     Get.offAll(() => home());
//   } else {
//     Get.offAll(() => adminhome());

//   }
//   print(response.body.toString());  
// }

 TextEditingController mobilefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
class login1 extends StatefulWidget {
  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
// var orientation, size,height,width;
  @override
  Widget build(BuildContext context) {
    // size = size = MediaQuery.of(context).size;
    // width = size.width;
    // return Sizer(
    //   builder: (context, orientation, deviceType) {
    //    size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 238, 237, 237),
          body:  Padding(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: ListView(
        children: [
          Container(
            child: Column(children: [
              Image.asset("assets/login.png"),
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
            child:  TextField(
            controller: mobilefield,
              // obscureText: true,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 247, 245, 245),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                  hintText: 'Mobile',
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
              child:  TextField(
                controller: passwordfield,
                // obscureText: true,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 247, 245, 245),
                    filled: true,
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                    hintText: 'Password',
                    border: InputBorder.none),
              ),
            ),
              Container(
                height: 30,
                width: 60,
              
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  // RaisedButton(
                  //   child: const
                  TextButton(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromARGB(255, 7, 221, 89)),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => forgetpass()),
                    // );
                  },
                )
                
              ]
              ),
            ),

// )
          // SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 199, 196, 196),
          //       borderRadius: BorderRadius.circular(0)),
          //   height: 50,
          //   child: const TextField(
          //     // obscureText: true,
          //     decoration: InputDecoration(
          //         fillColor: Color.fromARGB(255, 247, 245, 245),
          //         filled: true,
          //         // border: OutlineInputBorder(
          //         //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
          //         hintText: 'Confirm Password',
          //         border: InputBorder.none),
          //   ),
          // ),
          SizedBox(
            height: 50,
          ),

          // loading
          //         ? Center(child: CircularProgressIndicator())
          //         : GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 // loading=false;
          //               });
          //               login(
          //                   name: _nameController.text,
          //                   password: _passwordController.text);
          //             },
          //             child: Container(
          //               height: 50,
          //               width: 5,
          //               margin: EdgeInsets.symmetric(horizontal: 75),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(0),
          //                 color: Color.fromARGB(255, 2, 228, 119),
          //               ),
          //               child: Center(
          //                 child: Text('Login',
          //                   style: TextStyle(
          //                       fontSize: 20.0,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold),
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ),
          //             ),
          //           ),

          Container(
            height: 50,
            width: 10,
            padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
            child: ElevatedButton(
              // color: Color.fromARGB(255, 2, 228, 119),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onPressed: () {
                // if (mobilefield.text.length != 10) {
                //   Fluttertoast.showToast(msg: 'Enter Vaild Mobile Number');
                // } else if (passwordfield.text.isEmpty) {
                //   Fluttertoast.showToast(msg: 'Enter Password');
                // } else {
                //   loginapi(mobilefield.text, passwordfield.text);
                // }
               
              
                // Navigator.push(context,MaterialPageRoute(builder: (context) => const subdealerhome()),);
                // print(_nameController.text);
               
              },
            ),
          ),
        ],
      ),
      )));
  }
}
