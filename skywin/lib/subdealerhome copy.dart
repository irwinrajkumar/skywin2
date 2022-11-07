import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:get/get.dart';
import 'package:irwin/subdealerlogin.dart';
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

// var baseurl = "http://194.163.43.178:8000/Manual_weight/";
// final TextEditingController nameController = new TextEditingController();
class subdealerhome1 extends StatefulWidget {
  String userid;
  // String name;

  subdealerhome1({Key? key, this.userid = ''}) : super(key: key);

  @override
  State<subdealerhome1> createState() => _subdealerhome1State();
}

class _subdealerhome1State extends State<subdealerhome1> {
  @override
  void initState() {
    imgdata();
    totalamnt();
    super.initState();
  }

  // var index = 0;
  var fetchdata = [];
  var totaldata;
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(
                      width: 80,
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
                                builder: (context) => const editprofile()),
                          ).then((value) {
                            imgdata();
                            totalamnt();
                          });
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
            ],
          ),

          backgroundColor: Color.fromARGB(255, 238, 237, 237),

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
                        : Container())),
            // actions: [
            //   new IconButton(
            //       icon: new Image.asset('assets/call.png'),
            //       onPressed: () => ("")),
            // ],
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Center(
                    child: Container(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                // if(totaldata.isNotEmpty)

                Row(children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 150,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // mainAxisSize: MainAxisSize.max,

                              children: <Widget>[
                                Image(image: AssetImage("assets/fill.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'You will give',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                //  totaldata!=null ? Text(''):
                                Text(
                                  '₹ ',
                                  // '₹ 0',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.green),
                                ),
                                if (totaldata != null)
                                  Text(
                                    "${totaldata['total_amount__sum'] ?? '0'}",
                                    // '₹ 0',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.green),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   child: Row(children: [
                //     Container(
                //       width: 260,
                //       height: 40,
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(0)),
                //       child: TextField(
                //         decoration: InputDecoration(
                //             prefixIcon: Image.asset('assets/search.png'),
                //             // suffixIcon: IconButton(
                //             //   icon: Icon(Icons.clear),
                //             //   onPressed: () {
                //             //     /* Clear the search field */
                //             //   },
                //             // ),
                //             hintText: 'search...',
                //             border: InputBorder.none),
                //       ),
                //     ),
                //     IconButton(
                //       icon: Image(
                //         image: AssetImage("assets/filter.png"),
                //       ),
                //       onPressed: () {
                //         // _tripEditModalBottonSheet(context);
                //       },
                //     ),
                //     IconButton(
                //         onPressed: () {},
                //         icon: Image(
                //           image: AssetImage("assets/pdf.png"),
                //         ))
                //   ]),
                // ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  height: Get.height / 1.7,
                  // width: 360,
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
                            onTap: (() {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const SubDealerquote1()),
                              // );
                            }),
                            child: Container(
                              // margin: new EdgeInsets.symmetric(horizontal: 0),
                              // padding: EdgeInsets.symmetric(horizontal: 0),
                              height: 80,
                              // width: 349,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${fetchdata[index]['date'] ?? ''}",
                                              // '08 Jan 22 • 08.51 PM',
                                              style: TextStyle(fontSize: 15),
                                            ),

                                            // Padding(
                                            //   padding: const EdgeInsets.only(left: 20),
                                            //   child: Row(
                                            //     children: [
                                            //       // Text('bal.₹ '),
                                            //       // Text(
                                            //       //   fetchdata[index]['balance'].toString(),
                                            //       //   )
                                            //       ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            fetchdata[index]['total_amount'] == null
                                                ? Text('')
                                                : Text(
                                                    '₹ ',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.green),
                                                  ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 10),
                                              child: Text(
                                                "${fetchdata[index]['total_amount'] ?? ''}",
                                                // '₹ 40',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.green),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('₹ 1000')
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Row(
                                              children: [
                                                Text('₹1000')
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        height: 80,
                        width: 80,
                        //  color: Colors.amber,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromARGB(255, 103, 219, 107),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubDealerquote(
                                          userid: widget.userid,
                                        )),
                              ).then((value) {
                                imgdata();
                                totalamnt();
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 60,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )))));

    // SizedBox(
    //   height: 5,
    // ),
    // Container(
    //   height: Get.height / 2,
    //   child: ListView.builder(
    //       itemCount: 10,
    //       // itemCount: fetchdata.length,
    //       shrinkWrap: true,
    //       // physics: NeverScrollableScrollPhysics(),
    //       itemBuilder: (context, index) {
    //         return Column(
    //           children: [
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Container(
    //               height: 90,
    //               width: 500,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //               ),
    //               child: Container(
    //                 child: Column(
    //                   children: [
    //                     Column(
    //                       children: [
    //                         Row(
    //                           children: [
    //                             SizedBox(
    //                               width: 10,
    //                               height: 60,
    //                             ),

    //                             // mainAxisAlignment: MainAxisAlignment.center,
    //                             Text(
    //                               "Qty: ",
    //                               style: TextStyle(fontSize: 18),
    //                             ),

    //                             Text(

    //                               fetchdata[index]['net_weight'].toString(),
    //                     //           totalamontController.text=(int.parse(GrossweightController.text.isEmpty?
    //                     // '0':GrossweightController.text)+int.parse
    //                     // (GunnyBagsweightController.text.isEmpty?'0':GrossweightController.text)).toString(),
    //                               style: TextStyle(fontSize: 18),
    //                             ),
    //                             SizedBox(width: 180),
    //                             Text(
    //                               "Rate: ",
    //                               style: TextStyle(
    //                                   fontSize: 15, color: Colors.green),
    //                             ),
    //                             Text(
    //                               fetchdata[index]['rate'],
    //                               style: TextStyle(
    //                                   fontSize: 15, color: Colors.green),
    //                             ),
    //                           ],
    //                         ),
    //                         SizedBox(
    //                           height: 5,
    //                         )
    //                       ],
    //                     ),
    //                     Container(
    //                       child: Row(
    //                         children: [
    //                           SizedBox(
    //                             width: 10,
    //                           ),
    //                           Text(
    //                             "Date: ",
    //                             style: TextStyle(
    //                                 fontSize: 15, color: Colors.green),
    //                           ),
    //                           Text(
    //                             fetchdata[index]['date'],
    //                             style: TextStyle(fontSize: 15),
    //                           ),
    //                           SizedBox(width: 90),
    //                           Text(
    //                             "Total Amt: ",
    //                             style: TextStyle(
    //                                 fontSize: 15,
    //                                 color:
    //                                     Color.fromARGB(255, 15, 17, 15)),
    //                           ),
    //                           Text(
    //                             fetchdata[index]['total_amount'],
    //                             style: TextStyle(
    //                                 fontSize: 15, color: Colors.green),
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         );
    //       }),
    // )

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
    setState(() {
      name = pref.getString('username');
      print(name);
    });

    var decodeValue = json.decode(res.body);
    setState(() {
      fetchdata = decodeValue["data"];

      //     ad_banner=decodeValue['data']['main_banner'];
    });
  }

  Future<void> totalamnt() async {
    var id = widget.userid;
    var url = "http://194.163.43.178:8000/user_total_amnt/${id}";
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
    //   total = pref.getString('total_amount__sum');
    // });
    var pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('username');
      print(name);
    });
    var decodeValue = json.decode(res.body);
    setState(() {
      totaldata = decodeValue["data"];

      //     ad_banner=decodeValue['data']['main_banner'];
    });
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
