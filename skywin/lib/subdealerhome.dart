import 'dart:io';
import 'color code.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:get/get.dart';
import 'package:irwin/subdealerlogin.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:irwin/SubDealerquoteinput.dart';
// import 'package:irwin/main.dart';
// import 'package:irwin/reportpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'Admininputpage.dart';
// import 'adminprofile.dart';
// import 'changepassword.dart';
// import 'editperfile.dart';
// import 'profilesubdearler.dart';
import 'SubDealerquoteinput.dart';
import 'SubDealerquoteinput1.dart';
// import 'package:sidenavbar/sidenavbar.dart';
// import 'package:get/get.dart';
import 'dart:convert';
// import 'dart:ffi';
import 'package:http/http.dart' as http;
// import 'SubDealerquoteinput.dart';
import 'adminhome.dart';
import 'dart:async';
import 'package:sizer/sizer.dart';

import 'main.dart';
import 'subdealerchangepassword.dart';
import 'subdealereditprofile.dart';

var name;
// var userid;
// var total;

class subdealerhome extends StatefulWidget {
  String userid;
  // String name;

  subdealerhome({Key? key, this.userid = ''}) : super(key: key);

  @override
  State<subdealerhome> createState() => _subdealerhomeState();
}

class _subdealerhomeState extends State<subdealerhome> {
  @override
  void initState() {
    imgdata();
    subdealer();
    balance();
    super.initState();
  }

  // var index = 0;
  var fetchdata = [];
  var totaldata;
  var paiddata;

  Future openfile({required String url, String? filename}) async {
    var file = await downloadFile(url, filename!);
    if (file == null) return;

    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  Widget build(BuildContext context) {
    mediaSize(context);
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 118, 218, 4),
                            child: TextButton(
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) => const adminprofile()),);
                                },
                                child: name != null
                                    ? Text(
                                        "${name[0]}${name[1]}".toUpperCase(),
                                      )
                                    : Container())),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${name}'.toString(),
                              style: TextStyle(
                                color: Color.fromARGB(255, 73, 34, 34),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        
                        
                      ]),
                      Row(
                        children: [
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
                                        builder: (context) => const editprofile()),
                                  ).then((value) {
                                    imgdata();
                                    subdealer();
                                    balance();
                                  });
                                  // print(nameController.text);
                                  // print(passwordController.text);
                                },
                              ),
                            ),
                        ],
                      )
                    ],
                  )
                ])),
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
                        builder: (context) => const changepassword()),
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
                            SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();
                                        pref.clear();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        login()),
                                                (Route<dynamic> route) =>
                                                    false);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),

          // drawer: profilesubdearler(),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(234, 240, 236, 236),
          elevation: 0,
          title: Text(
            '${name}'.toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: Builder(
            builder: (context) => CircleAvatar(
              backgroundColor: Color.fromARGB(255, 118, 218, 4),
              child: TextButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),

                  // Navigator.of(context).pop();

                  child: name != null
                      ? Text(
                          "${name[0]}${name[1]}".toUpperCase(),
                        )
                      : Container()),
            ),
          ),
          actions: [
            IconButton(
              icon: Image(
                  image: AssetImage(
                "assets/pdf.png",
              )),
              onPressed: () => openfile(
                  url: 'http://194.163.43.178:8000/report', filename: 'report'),
              // Navigator.pop(context);
              // print(nameController.text);
              // print(passwordController.text);
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Center(
                    child: Container(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(children: [
                  Flexible(
                    // flex: 1,
                    // fit: FlexFit.tight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 15,
                      height: MediaQuery.of(context).size.height * .12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Container(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(image: AssetImage("assets/fill.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text('₹',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.green)),
                                      if (totaldata?['total_amount__sum'] !=
                                          null)
                                        Text(
                                          "${totaldata['total_amount__sum']}",
                                          // '${balancedata.toString()[0]}' ==
                                          //         '-'
                                          //     ? '${balancedata.toString().substring(1)}'
                                          //     : '$balancedata',
                                          // "${balancedata['total_amount__sum']}",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.green),
                                        ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'பெற வேண்டியது',
                                    style: TextStyle(
                                      fontSize: 8,
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
                    width: 10,
                  ),
                  Flexible(
                    // flex: 1,
                    // fit: FlexFit.loose,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 5,
                      height: MediaQuery.of(context).size.height * .12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Container(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(image: AssetImage("assets/Group 7.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '₹',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.red),
                                      ),
                                      //   if (youdata?['paid_amount__sum'] !=
                                      // null)
                                      if (paiddata?['paid_amount__sum'] != null)
                                        Text(
                                          "${paiddata['paid_amount__sum']}",
                                          // "${youdata['paid_amount__sum']}",
                                          style: TextStyle(
                                              fontSize: 22, color: Colors.red),
                                        ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'கொடுக்க வேண்டியது',
                                    style: TextStyle(
                                      fontSize: 8,
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
                //
                SizedBox(
                  height: 20,
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * .89,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            'ENTRIES',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Text(
                              'YOU GIVE',
                              style: TextStyle(fontSize: 15, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'YOU GOT',
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height_ / 1.7,
                  // width: 360,
                  child: ListView.builder(
                      itemCount: fetchdata.length,
                      // itemCount: 10,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           SubDealerquote(
                              //             mobiledata:
                              //                 fetchdata[index],
                              //             userid: widget.userid,
                              //             iddata:
                              //                 fetchdata[index]
                              //                         ["id"]
                              //                     .toString(),
                              //           )),
                              // ).then((value) {
                              //   // imgdata();
                              //   subdealer();
                              //   balance();
                              // });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .89,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5.0,
                                    ),
                                  ]),
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${fetchdata[index]['date'] ?? '0'}",
                                                // '08 Jan 22 • 08.51 PM',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          fetchdata[index]['net_weight'] != null
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      'Net Weight =',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "${fetchdata[index]['net_weight']}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      'kg',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Text(
                                                        "${fetchdata[index]['farmer_name'].toString()}"),
                                                  ],
                                                ),
                                          fetchdata[index]['rate'] != null
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      'Rate=',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "${fetchdata[index]['rate'] ?? '0'}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                )
                                              : Text(""),
                                          fetchdata[index]['remarks'] != null
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${fetchdata[index]['remarks'] ?? '0'}",
                                                    ),
                                                  ],
                                                )
                                              : Text(""),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    // flex: 6,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 95,
                                          width: 100,
                                          color: Color.fromARGB(
                                              255, 238, 211, 210),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Row(children: [
                                              fetchdata[index]['paid_amount'] ==
                                                      null
                                                  ? Text('')
                                                  : Text('₹',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.red)),
                                              Text(
                                                "${fetchdata[index]['paid_amount'] ?? ''}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.red),
                                              ),
                                            ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Row(
                                            children: [
                                              fetchdata[index]
                                                          ['total_amount'] ==
                                                      null
                                                  ? Text('')
                                                  : Text('₹',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.green)),
                                              Text(
                                                "${fetchdata[index]['total_amount'] ?? ''}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]);
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // height: 50,
                      width: 200,
                      // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green // background
                            // onPrimary: Colors.yellow, // foreground
                            ),
                        // color: const Color.fromARGB(
                        // 255, 2, 228, 119),
                        child: const Text(
                          'YOU GOT ₹',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubDealerquote(
                                      userid: widget.userid,
                                    )),
                          ).then((value) {
                            imgdata();
                            subdealer();
                            balance();
                          });

                          // .then((value) {
                          //   subdealer();
                          //   balance();
                          // }); // print(nameController.text);
                          // print(passwordController.text);
                        },
                      ),
                    ),
                  ],
                )
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(0),
                //         height: 80,
                //         width: 80,
                //         //  color: Colors.amber,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(40),
                //           color: Color.fromARGB(255, 103, 219, 107),
                //         ),
                //         child: IconButton(
                //             onPressed: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => SubDealerquote(
                //                           userid: widget.userid,
                //                         )),
                //               ).then((value) {
                //                 imgdata();
                //                 balance();
                //               });
                //             },
                //             icon: Icon(
                //               Icons.add,
                //               size: 60,
                //             )),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        )))));

    //
    //
  }

  Future<void> imgdata() async {
    // print(widget.userid);
    var id = widget.userid;
    var url = "http://194.163.43.178:8000/userQuotelist/${id}";
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
    if (mounted) {
      setState(() {
        name = pref.getString('username');
        print(name);
      });
    }

    var decodeValue = json.decode(res.body);
    setState(() {
      fetchdata = decodeValue["data"];

      //     ad_banner=decodeValue['data']['main_banner'];
    });
  }

  // Future<void> totalamnt() async {
  //   var id = widget.userid;
  //   var url = "http://194.163.43.178:8000/user_total_amnt/${id}";
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
  //   //   total = pref.getString('total_amount__sum');
  //   // });
  //   var pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = pref.getString('username');
  //     print(name);
  //   });
  //   var decodeValue = json.decode(res.body);
  //   setState(() {
  //     totaldata = decodeValue["data"];

  //     //     ad_banner=decodeValue['data']['main_banner'];
  //   });

  // }
  Future<void> balance() async {
    var id = widget.userid;
    var url = "http://194.163.43.178:8000/subdealer_total_amnt/$id";

    var finalurl = Uri.parse(url);
    var res = await http.get(
      finalurl,
      headers: <String, String>{},
    );

    var decodeValue = json.decode(res.body);
    if (mounted) {
      setState(() {
        totaldata = decodeValue["total_amount"];
        paiddata = decodeValue["paid_amount"];

        //     ad_banner=decodeValue['data']['main_banner'];
      });
    }
  }

  Future<void> subdealer() async {
    // var pref = await SharedPreferences.getInstance();
    print(widget.userid);
    var id = widget.userid;
    var url = "http://194.163.43.178:8000/subdealer_data/${id}";
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

    // var pref = await SharedPreferences.getInstance();
    // setState(() {
    //   First = pref.getString('username');
    // });

    var decodeValue = json.decode(res.body);
    if (mounted) {
      setState(() {
        fetchdata = decodeValue["data"];
        fetchdata.sort((a, b) => a['id'].compareTo(b['id']));

        //     ad_banner=decodeValue['data']['main_banner'];
      });
    }
  }
// int id = 1;
// // int ids = 3;
// String radioItem = '1';
// int _value = 0;
// // int _value1 = 1;
// void _tripEditModalBottonSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (context) => StatefulBuilder(builder: (context, setState) {
//             return SingleChildScrollView(
//                 child: Column(children: [
//               Container(
//                   height: MediaQuery.of(context).size.height * .78,
//                   child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Column(children: [
//                         Row(children: [
//                           Text(
//                             'Filter by',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 94, 238, 99),
//                             ),
//                           ),
//                         ]),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 // borderRadius: BorderRadius.only(
//                                 //     topLeft: Radius.circular(10),
//                                 //     topRight: Radius.circular(10),
//                                 //     bottomLeft: Radius.circular(10),
//                                 //     bottomRight: Radius.circular(10)),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 5,
//                                     blurRadius: 7,
//                                     offset: Offset(
//                                         0, 3), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => _value = 0),
//                                 child: Container(
//                                   height: 96,
//                                   width: 90,
//                                   decoration: BoxDecoration(
//                                     color: _value == 0
//                                         ? Color.fromARGB(255, 80, 247, 116)
//                                         : Colors.transparent,
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("ALL",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold))
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 40,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 // borderRadius: BorderRadius.only(
//                                 //     topLeft: Radius.circular(10),
//                                 //     topRight: Radius.circular(10),
//                                 //     bottomLeft: Radius.circular(10),
//                                 //     bottomRight: Radius.circular(10)),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color.fromARGB(255, 130, 33, 175)
//                                         .withOpacity(0.5),
//                                     // spreadRadius: 5,
//                                     blurRadius: 6,
//                                     offset: Offset(
//                                         0, 1), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => _value = 1),
//                                 child: Container(
//                                   height: 40,
//                                   width: 200,
//                                   decoration: BoxDecoration(
//                                     color: _value == 1
//                                         ? Color.fromARGB(255, 80, 247, 116)
//                                         : Colors.transparent,
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [Text("balance")],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 40,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 // borderRadius: BorderRadius.only(
//                                 //     topLeft: Radius.circular(10),
//                                 //     topRight: Radius.circular(10),
//                                 //     bottomLeft: Radius.circular(10),
//                                 //     bottomRight: Radius.circular(10)),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color.fromARGB(255, 130, 33, 175)
//                                         .withOpacity(0.5),
//                                     // spreadRadius: 5,
//                                     blurRadius: 6,
//                                     offset: Offset(
//                                         0, 1), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => _value = 2),
//                                 child: Container(
//                                   height: 40,
//                                   width: 200,
//                                   decoration: BoxDecoration(
//                                     color: _value == 2
//                                         ? Color.fromARGB(255, 80, 247, 116)
//                                         : Colors.transparent,
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [Text("Spending")],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height * .60,
//                           child: Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Column(
//                               children: [
//                                 Row(children: [
//                                   Text(
//                                     'Sort by',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Color.fromARGB(255, 94, 238, 99),
//                                     ),
//                                   ),
//                                 ]),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                     height: 330,
//                                     width: 400,
//                                     decoration: BoxDecoration(
//                                       color: Color.fromARGB(255, 218, 216, 216),
//                                     ),
//                                     child: Container(
//                                       padding: EdgeInsets.all(10),
//                                       margin: EdgeInsets.all(10),
//                                       child: Column(children: [
//                                         Row(
//                                           children: [
//                                             Text('This Month'),
//                                             SizedBox(
//                                               width: 190,
//                                             ),
//                                             Radio(
//                                               value: 0,
//                                               groupValue: id,
//                                               onChanged: (val) {
//                                                 setState(() {
//                                                   var radioButtonItem = 'Yes';
//                                                   id = 0;
//                                                 });
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.all(0),
//                                           margin: EdgeInsets.all(0),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Text('This Week'),
//                                                   SizedBox(
//                                                     width: 195,
//                                                   ),
//                                                   Radio(
//                                                     value: 1,
//                                                     groupValue: id,
//                                                     onChanged: (val) {
//                                                       setState(() {
//                                                         var radioButtonItem =
//                                                             'Yes';
//                                                         id = 1;
//                                                       });
//                                                     },
//                                                   ),
//                                                 ],
//                                               ),
//                                               Container(
//                                                 padding: EdgeInsets.all(0),
//                                                 margin: EdgeInsets.all(0),
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Text('Highest Amount'),
//                                                         SizedBox(
//                                                           width: 159,
//                                                         ),
//                                                         Radio(
//                                                           value: 2,
//                                                           groupValue: id,
//                                                           onChanged: (val) {
//                                                             setState(() {
//                                                               var radioButtonItem =
//                                                                   'Yes';
//                                                               id = 2;
//                                                             });
//                                                           },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Container(
//                                                       padding:
//                                                           EdgeInsets.all(0),
//                                                       margin: EdgeInsets.all(0),
//                                                       child: Column(
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               Text(
//                                                                   'Least Amount'),
//                                                               SizedBox(
//                                                                 width: 173,
//                                                               ),
//                                                               Radio(
//                                                                 value: 3,
//                                                                 groupValue: id,
//                                                                 onChanged:
//                                                                     (val) {
//                                                                   setState(() {
//                                                                     var radioButtonItem =
//                                                                         'Yes';
//                                                                     id = 3;
//                                                                   });
//                                                                 },
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       padding:
//                                                           EdgeInsets.all(0),
//                                                       margin: EdgeInsets.all(0),
//                                                       child: Column(
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               Text(
//                                                                   'oldest Amount'),
//                                                               SizedBox(
//                                                                 width: 168,
//                                                               ),
//                                                               Radio(
//                                                                 value: 4,
//                                                                 groupValue: id,
//                                                                 onChanged:
//                                                                     (val) {
//                                                                   setState(() {
//                                                                     var radioButtonItem =
//                                                                         'Yes';
//                                                                     id = 4;
//                                                                   });
//                                                                 },
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       padding:
//                                                           EdgeInsets.all(0),
//                                                       margin: EdgeInsets.all(0),
//                                                       child: Column(
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               Text(
//                                                                   'Newest Amount'),
//                                                               SizedBox(
//                                                                 width: 160,
//                                                               ),
//                                                               Radio(
//                                                                 value: 5,
//                                                                 groupValue: id,
//                                                                 onChanged:
//                                                                     (val) {
//                                                                   setState(() {
//                                                                     var radioButtonItem =
//                                                                         'Yes';
//                                                                     id = 5;
//                                                                   });
//                                                                 },
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ]),
//                                     )),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   width: 320,
//                                   padding:
//                                       const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                   child: RaisedButton(
//                                     color: Color.fromARGB(255, 2, 228, 119),
//                                     child: const Text(
//                                       'View Result',
//                                       style: TextStyle(
//                                           fontSize: 17, color: Colors.white),
//                                     ),
//                                     onPressed: () {
//                                       // Navigator.push(context,MaterialPageRoute(builder: (context) => const adminhome()),);
//                                       // print(nameController.text);
//                                       // print(passwordController.text);
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ])))
//             ]));
//           }));
// }
}
