import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irwin/adduser.dart';
import 'package:irwin/subdealerhome.dart';
import 'package:irwin/subdealerquate.dart';

import 'adminchangepassword.dart';
import 'admineditprofile.dart';
import 'adminsubdealerlist.dart';
import 'main.dart';
import 'viewrepot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: adminhome(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

var firstname;
var lastname;
var userid;

class adminhome extends StatefulWidget {
  const adminhome({Key? key}) : super(key: key);

  @override
  State<adminhome> createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  @override
  void initState() {
    admindata();
    super.initState();
  }

  var fetchdata = [];
  var youdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 237, 237),
        drawer: Drawer(
          child: ListView(
            // padding: EdgeInsets.zero,
            children: [
              Container(
                height: 80,
                child: DrawerHeader(
                    child: Column(children: [
                  Row(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 118, 218, 4),
                      child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => const adminprofile()),);
                          },
                          child: lastname != null
                              ? Text(
                                  "${lastname[0]}${lastname[1]}".toUpperCase(),
                                )
                              : Container()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${lastname}'.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 73, 34, 34),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      // height: 35,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        // color: Color.fromARGB(255, 12, 12, 12),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 219, 217, 217)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const admineditprofile()),
                          );
                          // print(nameController.text);
                          // print(passwordController.text);
                        },
                      ),
                    )
                  ])
                ])),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/list.png",
                  width: 50,
                ),
                title: const Text('Sub dealer list'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const subdealerlist()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/info.png",
                  width: 50,
                ),
                title: const Text('About App'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/lock.png",
                  width: 50,
                ),
                title: const Text('Change Password'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const adminchangepassword()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/gavel.png",
                  width: 50,
                ),
                title: const Text('Terms & Conditions'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/verified.png",
                  width: 50,
                ),
                title: const Text('Privacy policy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/logout.png",
                  width: 50,
                ),
                title: const Text('Logout'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (contect) => AlertDialog(
                      title: Text('Are You sure you want to Logout?'),
                      actions: [
                        TextButton(
                          child: Text('CANCEL'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text('OK'),
                          onPressed: () async {
                            var pref = await SharedPreferences.getInstance();
                            await pref.clear();
                            Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(builder: (context) => login()),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              // ListTile(
              //   title: const Text('Relative'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   title: const Text('Friend'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
          //   backgroundColor: Color.fromARGB(255, 238, 237, 237),
          //   // drawer: NavBar(),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 237, 237),
          elevation: 0,
          title: Text(
            '${lastname}'.toString(),
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          leading: Builder(
            builder: (context) => CircleAvatar(
                backgroundColor: Color.fromARGB(255, 118, 218, 4),
                child: TextButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),

                  // Navigator.of(context).pop();

                  child: lastname != null
                      ? Text(
                          "${lastname[0]}${lastname[1]}".toUpperCase(),
                        )
                      : Container(),
                )),
          ),
          // actions: [
          //   new IconButton(
          //       icon: new Image.asset('assets/person.png'),
          //       onPressed: () {
          //         // Navigator.push(
          //         //   context,
          //         //   MaterialPageRoute(builder: (context) => const adduser()),
          //         // );
          //       }),
          // ],
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Center(
                  child: Container(
                    margin:EdgeInsets.all(15) ,
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(children: [
                            Row(children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .87,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        //                   <--- right side
                                        color: Color.fromARGB(255, 248, 206, 206),
                                        width: 1.0,
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image(
                                              image: AssetImage(
                                                  "assets/fill.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('₹',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.green)),
                                                  if (youdata?[
                                                          'total_amount__sum'] !=
                                                      null)
                                                    Text(
                                                      "${youdata['total_amount__sum']}",
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.green),
                                                    ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'You will get',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              
                              Flexible(
                                flex: 1,
                                fit: FlexFit.loose,
                                child: Container(
                                  
                                  width: MediaQuery.of(context).size.width * .44,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image(
                                              image: AssetImage(
                                                  "assets/Group 7.png")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.red),
                                                  ),
                                                  if (youdata?[
                                                          'paid_amount__sum'] !=
                                                      null)
                                                    Text(
                                                      "${youdata['paid_amount__sum']}",
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.red),
                                                    ),
                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'You will give',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ]),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Container(
                                  // height: 40,
                                  width: MediaQuery.of(context).size.width * .89,
                                  
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                  // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextButton(
                                      // color: const Color.fromARGB(
                                      // 255, 2, 228, 119),
                                      child: const Text(
                                        'VIEW REROPT >',
                                        style: TextStyle(
                                            fontSize: 17, color: Color.fromARGB(255, 37, 211, 52)),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const viewrepot()),
                                        );
                                        // print(nameController.text);
                                        // print(passwordController.text);
                                      },
                                    ),
                                  )
                                  
                                )
                                
                              ],
                            ),
                            
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                // height: 60,
                                width: MediaQuery.of(context).size.width * .89,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 5.0)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'ENTRIES',
                                          // '₹ Entries',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 55),
                                    //   child: Row(
                                    //     children: [
                                    //       Text(
                                    //         'YOU GAVE',
                                    //         style: TextStyle(
                                    //           fontSize: 15,
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Text(
                                      'BALANCE',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            // SizedBox(
                            //   height: 0,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(5.0),
                            //   child: Container(
                            //     child: Row(children: [
                            //       Container(
                            //         width: 250,
                            //         height: 40,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(0)),
                            //         child: TextField(
                            //           decoration: InputDecoration(
                            //               prefixIcon:
                            //                   Image.asset('assets/search.png'),
                            //               hintText: 'search...',
                            //               border: InputBorder.none),
                            //         ),
                            //       ),
                            //       IconButton(
                            //         onPressed: () {},
                            //         icon: Image(
                            //           image: AssetImage("assets/filter.png"),
                            //         ),
                            //       ),
                            //       IconButton(
                            //           onPressed: () {},
                            //           icon: Image(
                            //             image: AssetImage("assets/pdf.png"),
                            //           ))
                            //     ]),
                            //   ),
                            // ),
                            Container(
                              height: Get.height / 2,
                              child: ListView.builder(
                                  itemCount: fetchdata.length,
                                  shrinkWrap: true,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: (() async {
                                          //   var pref = await SharedPreferences
                                          //       .getInstance();
                                          //   setState(() {
                                          //  pref.setString(
                                          //       'username',fetchdata[index]
                                          //                       ["username"]
                                          //     );
                                          //   }
                                          //   );
                                          print(
                                              '${fetchdata[index]["id"].toString()}');
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Subdealer(
                                                      mobilenum:
                                                          fetchdata[index]
                                                                  ["mobile"]
                                                              .toString(),
                                                      lastname: fetchdata[index]
                                                              ["username"]
                                                          .toString(),
                                                      userid: fetchdata[index]
                                                              ["id"]
                                                          .toString(),
                                                    )),
                                          );
                                        }),
                                        child: Container(
                                          // margin: new EdgeInsets.symmetric(horizontal: 0),
                                          // padding: EdgeInsets.symmetric(horizontal: 0),
                                          // height: 60,
                                          width: MediaQuery.of(context).size.width * .89,
                                          // width: 349,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 5.0,
                                                )
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                    height: 60,
                                                  ),
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 118, 218, 4),
                                                      child: lastname != null
                                                          ? Text(
                                                              "${fetchdata[index]['username'].toString()[0]}${fetchdata[index]['username'].toString()[1]}"
                                                                  .toUpperCase(),
                                                              // ("${fetchdata[index][username]}${username[1]}"??""),
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          : Container()),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    fetchdata[index]
                                                        ["username"],
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: Row(
                                                  children: [
                                                    fetchdata[index]['bls'] ==
                                                            null
                                                        ? Text('')
                                                        : Text('₹',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: '${fetchdata[index]["bls"].toString()[0]}' ==
                                                                        '-'
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .green)),
                                                    Text(
                                                      '${fetchdata[index]["bls"].toString()[0]}' ==
                                                              '-'
                                                          ? '${fetchdata[index]["bls"].toString().substring(1)}'
                                                          : '${fetchdata[index]["bls"].toString()}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              '${fetchdata[index]["bls"].toString()[0]}' ==
                                                                      '-'
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .green),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]);
                                  }),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 150,
                                      // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                                      child: ElevatedButton(
                                        // color: const Color.fromARGB(
                                        // 255, 2, 228, 119),
                                        child: const Text(
                                          'Add User',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const adduser()),
                                          );
                                          // print(nameController.text);
                                          // print(passwordController.text);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]))))),
        ));
  }

  Future<void> admindata() async {
    // var pref = await SharedPreferences.getInstance();
    // print(widget.userid);
    // var id = widget.userid;
    var url = "http://194.163.43.178:8000/Total_calculation";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    //  var customerId= pref.getString('customer_id');
    //  var episodeid= pref.getString('episode_id');
    //  var storyid= pref.getString('story_id');
    //   var page= pref.getString('page');
    //  print(customerId);
    var finalurl = Uri.parse(url);
    var res = await http.get(
      finalurl,
      headers: <String, String>{},
    );
    var pref = await SharedPreferences.getInstance();
    setState(() {
      lastname = pref.getString('username');
      print(lastname);
    });

    var decodeValue = json.decode(res.body);
    setState(() {
      fetchdata = decodeValue["data"];
      youdata = decodeValue;

      // ad_banner=decodeValue['data']['main_banner'];
    });
  }
  // Future<void> ddddd() async {
  //   // var pref = await SharedPreferences.getInstance();
  //   // print(widget.userid);
  //   // var id = widget.userid;
  //   var url = "http://194.163.43.178:8000/Total_calculation/";
  //   // checker(context) async {
  //   // var pref=await SharedPreferences.getInstance();
  //   //  var customerId= pref.getString('customer_id');
  //   //  var episodeid= pref.getString('episode_id');
  //   //  var storyid= pref.getString('story_id');
  //   //   var page= pref.getString('page');
  //   //  print(customerId);
  //   var finalurl = Uri.parse(url);
  //   var res = await http.get(
  //     finalurl,
  //     headers: <String, String>{},
  //   );
  //   // var pref = await SharedPreferences.getInstance();
  //   // setState(() {
  //   //   lastname = pref.getString('username');
  //   //   print(lastname);
  //   // }
  //   // );

  //   var decodeValue = json.decode(res.body);
  //   setState(() {
  //     youdata = decodeValue;

  //   });
  // }
}
