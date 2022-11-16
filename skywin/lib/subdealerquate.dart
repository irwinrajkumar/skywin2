import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'color code.dart';

import 'package:flutter/material.dart';
import 'package:irwin/viewrepot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SubDealerquoteinput2.dart';
import 'SubDealerquoteinput.dart';
// import 'SubDealerquoteinput1.dart';
// import 'SubDealerquoteinput2.dart';
import 'paymentpage.dart';
import 'package:open_file/open_file.dart';
// import 'package:irwin/reportpage.dart';

// import 'Admininputpage.dart';
// import 'Editentrypage.dart';
// import 'adminhome.dart';
// import 'adminquoteinput.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
// final TextEditingController _numberCtrl = TextEditingController();

// var username;

class Subdealer extends StatefulWidget {
  String mobilenum;
  String lastname;
  String userid;
  Subdealer(
      {Key? key, this.mobilenum = '', this.lastname = '', this.userid = ''})
      : super(key: key);

  @override
  State<Subdealer> createState() => _SubdealerState();
}

class _SubdealerState extends State<Subdealer> {
  @override
  void initState() {
    subdealer();
    imgdata();
    balance();

    // subdealercall();
    super.initState();
  }

  var fetchdata = [];
  // var calldata = [];
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
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 238, 240, 237),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0), // here the desired height
              child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Image(
                                  image: AssetImage(
                                "assets/arrowback.png",
                              )),
                              onPressed: () {
                                Navigator.pop(context);
                                // print(nameController.text);
                                // print(passwordController.text);
                              }),
                          CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 118, 218, 4),
                              child: widget.lastname != ''
                                  ? Text(
                                      "${widget.lastname[0]}${widget.lastname[1]}"
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    )
                                  : Container()),
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const Admininput()),
                              // );
                            },
                            child: Text(
                              '${widget.lastname}'.toString(),
                              // "Subdealer",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Image(
                                image: AssetImage(
                              "assets/pdf.png",
                            )),
                            onPressed: () => openfile(
                                url: 'http://194.163.43.178:8000/report',
                                filename: 'report'),
                            // Navigator.pop(context);
                            // print(nameController.text);
                            // print(passwordController.text);
                          ),
                          // if(calldata != null)
                          //  SizedBox(width: 10),
                          IconButton(
                            icon: new Image.asset('assets/call.png'),
                            onPressed: () async {
                              final call = Uri.parse(
                                  'tel:+91 ${widget.mobilenum.toString()}');
                              if (await canLaunchUrl(call)) {
                                launchUrl(call);
                              } else {
                                throw 'Could not launch $call';
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                backgroundColor: Color.fromARGB(255, 238, 240, 237),
                elevation: 0,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  child: Center(
                      child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(children: [
                                Row(children: [
                                  Flexible(
                                    // flex: 1,
                                    // fit: FlexFit.tight,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .12,
                                      // width: 170,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
                                                              color: Colors
                                                                  .green)),
                                                      if (totaldata?[
                                                              'total_amount__sum'] !=
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
                                                              color:
                                                                  Colors.green),
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
                                    width: 20,
                                  ),
                                  Flexible(
                                    // flex: 1,
                                    // fit: FlexFit.loose,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .12,
                                      // width: 170,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ]
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
                                                      //   if (youdata?['paid_amount__sum'] !=
                                                      // null)
                                                      if (paiddata?[
                                                              'paid_amount__sum'] !=
                                                          null)
                                                        Text(
                                                          "${paiddata['paid_amount__sum']}",
                                                          // "${youdata['paid_amount__sum']}",
                                                          style: TextStyle(
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.red),
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

                                  //   width: 20,
                                  // ),
                                  // Flexible(
                                  //   flex: 1,
                                  //   fit: FlexFit.loose,
                                  //   child: Container(
                                  //     width: 170,
                                  //     height: 100,
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //     ),
                                  //     child: Container(
                                  //       child: Center(
                                  //         child: Row(
                                  //           mainAxisSize: MainAxisSize.max,
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.center,
                                  //           children: <Widget>[
                                  //             Image(
                                  //                 image:
                                  //                     AssetImage("assets/Group 7.png")),
                                  //             SizedBox(
                                  //               width: 10,
                                  //             ),
                                  //             Column(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.center,
                                  //               children: [
                                  //                 Text(
                                  //                   '₹ 0',
                                  //                   style: TextStyle(fontSize: 22,color: Colors.red),
                                  //                 ),
                                  //                 SizedBox(width: 10),
                                  //                 Text(
                                  //                   'You will get',
                                  //                   style: TextStyle(
                                  //                       fontSize: 15,
                                  //                       ),
                                  //                 )
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ]),
                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  padding: EdgeInsets.all(15),
                                  width:
                                      MediaQuery.of(context).size.width * .89,
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            padding:
                                                const EdgeInsets.only(left: 80),
                                            child: Text(
                                              'YOU GIVE',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'YOU GOT',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green),
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SubDealerquote2(
                                                          mobiledata:
                                                              fetchdata[index],
                                                          userid: widget.userid,
                                                          iddata:
                                                              fetchdata[index]
                                                                      ["id"]
                                                                  .toString(),
                                                        )),
                                              ).then((value) {
                                                // imgdata();
                                                subdealer();
                                                balance();
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .89,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .40,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${fetchdata[index]['date'] ?? '0'}",
                                                                // '08 Jan 22 • 08.51 PM',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          fetchdata[index][
                                                                      'net_weight'] !=
                                                                  null
                                                              ? Row(
                                                                  children: [
                                                                    Text(
                                                                      'Net Weight =',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Text(
                                                                      "${fetchdata[index]['net_weight']}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Text(
                                                                      'kg',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  ],
                                                                )
                                                              : Row(
                                                                  children: [
                                                                    Text(
                                                                        "${fetchdata[index]['farmer_name'].toString()}"),
                                                                  ],
                                                                ),
                                                          fetchdata[index][
                                                                      'rate'] !=
                                                                  null
                                                              ? Row(
                                                                  children: [
                                                                    Text(
                                                                      'Rate=',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Text(
                                                                      "${fetchdata[index]['rate'] ?? '0'}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ],
                                                                )
                                                              : Text(""),
                                                          fetchdata[index][
                                                                      'remarks'] !=
                                                                  null
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
                                                              255,
                                                              238,
                                                              211,
                                                              210),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 30),
                                                            child: Row(
                                                                children: [
                                                                  fetchdata[index]
                                                                              [
                                                                              'paid_amount'] ==
                                                                          null
                                                                      ? Text('')
                                                                      : Text(
                                                                          '₹',
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              color: Colors.red)),
                                                                  Text(
                                                                    "${fetchdata[index]['paid_amount'] ?? ''}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .red),
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
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 30),
                                                          child: Row(
                                                            children: [
                                                              fetchdata[index][
                                                                          'total_amount'] ==
                                                                      null
                                                                  ? Text('')
                                                                  : Text('₹',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.green)),
                                                              Text(
                                                                "${fetchdata[index]['total_amount'] ?? ''}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .green),
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
                                // SizedBox(
                                //   height: 0,
                                // ),
                                // Container(
                                //   height: Get.height / 2,
                                //   // width: 360,
                                //   child: ListView.builder(
                                //     itemCount: 1,
                                //       // itemCount: 10,
                                //       shrinkWrap: true,
                                //       // physics: NeverScrollableScrollPhysics(),
                                //       itemBuilder: (context, index) {
                                //         return Column(children: [
                                //           SizedBox(
                                //             height: 10,
                                //           ),
                                //           GestureDetector(
                                //             onTap: (() {
                                //               Navigator.push(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                     builder: (context) => const SubDealerquote2()),
                                //               );
                                //             }),
                                //             child: Container(
                                //               // margin: new EdgeInsets.symmetric(horizontal: 0),
                                //               // padding: EdgeInsets.symmetric(horizontal: 0),
                                //               height: 60,
                                //               // width: 349,
                                //               decoration: BoxDecoration(
                                //                 color: Colors.white,
                                //               ),
                                //               child: Container(
                                //                 child: Column(
                                //                   children: [
                                //                     Row(
                                //                       children: [
                                //                         // SizedBox(
                                //                         //   width: 10,
                                //                         //   height: 60,
                                //                         // ),
                                //                         // CircleAvatar(
                                //                         //   backgroundColor:
                                //                         //       Color.fromARGB(
                                //                         //           255, 118, 218, 4),
                                //                         //   child: Text(
                                //                         //     "Je",
                                //                         //     style: TextStyle(
                                //                         //         fontSize: 17,
                                //                         //         color: Colors.black),
                                //                         //   ),
                                //                         // ),
                                //                         SizedBox(
                                //                           width: 9,
                                //                         ),
                                //                         Padding(
                                //                           padding:
                                //                               const EdgeInsets.all(
                                //                                   8.0),
                                //                           child: Wrap(
                                //                             spacing: 0,
                                //                             children: [
                                //                               Text(
                                //                                 calldata[index]['date'].toString(),
                                //                                 // '08 Jan 22 • 08.51 PM',
                                //                                 style: TextStyle(
                                //                                     fontSize: 15),
                                //                               ),
                                //                               SizedBox(width: 80,),
                                //                               Column(
                                //                                 children: [
                                //                                   Row(
                                //                                     children: [
                                //                                       Text(
                                //                                         '₹ ',
                                //                                         style: TextStyle(
                                //                                             fontSize: 18,
                                //                                             color:
                                //                                                 Colors.green),
                                //                                       ),
                                //                                     ],
                                //                                   ),
                                //                                 ],
                                //                               ),

                                //                               // Text(
                                //                               //   fetchdata[index]['total_amount'].toString(),
                                //                               //   style: TextStyle(
                                //                               //       fontSize: 18,
                                //                               //       color:
                                //                               //           Colors.green),
                                //                               // ),
                                //                               SizedBox(width: 30,),
                                //                               Text(
                                //                                 '₹ ',
                                //                                 style: TextStyle(
                                //                                     fontSize: 18,
                                //                                     color:
                                //                                         Colors.red),
                                //                               ),
                                //                               Text(
                                //                                 calldata[index]['paid_amount'].toString(),
                                //                                 style: TextStyle(
                                //                                     fontSize: 18,
                                //                                     color:
                                //                                         Colors.red),
                                //                               ),
                                //                             ],
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                     Padding(
                                //                       padding: const EdgeInsets.only(
                                //                           left: 20),
                                //                       child: Row(
                                //                         children: [
                                //                           Text('Bal. ₹  '),
                                //                           Text(fetchdata[index]['balance'].toString(),),
                                //                         ],
                                //                       ),
                                //                     )
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //           )
                                //         ]);
                                //       }),
                                // ),
                                SizedBox(
                                  height: 6,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              // height: 50,
                                              // width: 200,
                                              // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                      Colors.red, // background
                                                  // onPrimary: Colors.yellow, // foreground
                                                ),
                                                // color: const Color.fromARGB(
                                                // 255, 2, 228, 119),
                                                child: const Text(
                                                  'YOU GAVE ₹',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            payment(
                                                              userid:
                                                                  widget.userid,
                                                            )),
                                                  ).then((value) {
                                                    subdealer();
                                                    balance();
                                                  }); // print(nameController.text);
                                                  // print(passwordController.text);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              // height: 50,
                                              // width: 200,
                                              // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .green // background
                                                    // onPrimary: Colors.yellow, // foreground
                                                    ),
                                                // color: const Color.fromARGB(
                                                // 255, 2, 228, 119),
                                                child: const Text(
                                                  'YOU GOT ₹',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SubDealerquote(
                                                              userid:
                                                                  widget.userid,
                                                            )),
                                                  ).then((value) {
                                                    imgdata();
                                                    // subdealer();
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
                                      ],
                                    ),
                                  ],
                                ),
                              ]))))),
            )));
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
//   Future<void> subdealercall() async {
//     var url = "http://194.163.43.178:8000/subdealer_data/";
//     // checker(context) async {
//     // var pref=await SharedPreferences.getInstance();
//     //  var customerId= pref.getString('customer_id');
//     //  var episodeid= pref.getString('episode_id');
//     //  var storyid= pref.getString('story_id');
//     //   var page= pref.getString('page');
//     //  print(customerId);
//     var pref = await SharedPreferences.getInstance();
//     var userid = pref.getString('id');
//     var finalurl = Uri.parse(url);
//     var res = await http.get(
//       finalurl,
//       headers: <String, String>{},
//     );
//     // var pref = await SharedPreferences.getInstance();
//     // setState(() {
//     //   First = pref.getString('username');
//     // });

//     var decodeValue = json.decode(res.body);
//     setState(() {
//       calldata = decodeValue["data"];
//       calldata.addAll(fetchdata);
//       // calldata.sort((a,b) =>DateTime.parse(a['created_date']).compareTo(DateTime.parse(b['created_date'])));
//        calldata.sort((a, b){ //sorting in ascending order
//         return DateTime.parse(a['created_date']).compareTo(DateTime.parse(b['created_date']));
//     }
//     );
// // print(calldata.length);
//     //     ad_banner=decodeValue['data']['main_banner'];
//     });
//   }
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
    // var pref = await SharedPreferences.getInstance();
    // setState(() {
    //   name = pref.getString('username');
    //   print(name);
    // });

    var decodeValue = json.decode(res.body);
    if (mounted) {
      setState(() {
        fetchdata = decodeValue["data"];

        //     ad_banner=decodeValue['data']['main_banner'];
      });
    }
  }
}
