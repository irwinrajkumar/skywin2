import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:irwin/adminprofile.dart';

// import 'adminhome.dart';
// import 'package:irwin/redbus.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
final TextEditingController startDateController = TextEditingController();
final TextEditingController endDateController = TextEditingController();

class viewrepot extends StatefulWidget {
  const viewrepot({Key? key}) : super(key: key);

  @override
  State<viewrepot> createState() => _viewrepotState();
}

final List<String> all = [
  'All',
];
String? allValue;
DateTime date = DateTime(1900, 07, 28);
// DateTime selectedDate = DateTime.now();

class _viewrepotState extends State<viewrepot> {
  @override
  @override
  void initState() {
    viewdata();

    // openfile();
    super.initState();
  }

  Future<void> viewdata() async {
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
    setState(() {});

    var decodeValue = json.decode(res.body);
    setState(() {
      baldata = decodeValue["data"];
      netbaldata = decodeValue;
    });
  }
  // Future<void> netbalance() async {
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
  //   var pref = await SharedPreferences.getInstance();
  //   setState(() {});

  //   var decodeValue = json.decode(res.body);
  //   setState(() {
  //     netbaldata = decodeValue;

  //   });
  // }

  var baldata = [];
  var netbaldata;

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
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 238, 240, 237),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0), // here the desired height
              child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //   GestureDetector(
                      // onTap: () {
                      //   setState(() {
                      //     // Toggle light when tapped.
                      //   //   Navigator.push(
                      //   //   context,
                      //   //   MaterialPageRoute(builder: (context) => const BottomNav()),
                      //   // );
                      //   });
                      // },),
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'View Report',
                        style: TextStyle(
                          fontSize: 23,
                          color: Color.fromARGB(255, 65, 240, 80),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Color.fromARGB(255, 238, 240, 237),
                elevation: 0,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // height: 0,
                  // width: 0,
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .42,
                            // height: 50,
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
                            // gradient: LinearGradient(
                            //   colors: [Color.white,Colors.black26]
                            // // ),
                            // image: const DecorationImage(
                            // alignment: FractionalOffset.centerLeft,
                            // image: AssetImage('assets/Group.png'),
                            // fit: BoxFit.fitWidth,
                            // )

                            child: TextFormField(
                              enabled: true,
                              controller: startDateController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(15),
                                  // labelText: '${date.year}/${date.month}/${date.day}',
                                  // labelStyle: const TextStyle(fontSize: 16, fontFamily: "palatino", color: Colors.black),
                                  // fillColor: Color.fromARGB(255, 247, 252, 249),
                                  // filled: true,
                                  prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: IconButton(
                                        onPressed: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                          );
                                          if (newDate == null) return;
                                          setState(() {
                                            date = newDate;
                                            startDateController.text =
                                                '${date.year}-${date.month}-${date.day}';
                                          });
                                        },
                                        icon: Icon(Icons.calendar_month)),
                                  ),
                                  // enabled: false,

                                  // border: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                  hintText: 'Start date',
                                  border: InputBorder.none),
                              // ),
                            ),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .42,
                            // height: 50,
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
                            child: TextFormField(
                              enabled: true,
                              controller: endDateController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(15),
                                  // labelText: '${date.year}/${date.month}/${date.day}',
                                  // labelStyle: const TextStyle(fontSize: 16, fontFamily: "palatino", color: Colors.black),
                                  // fillColor: Color.fromARGB(255, 247, 252, 249),
                                  // filled: true,
                                  prefixIcon: Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: IconButton(
                                        onPressed: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                          );
                                          if (newDate == null) return;
                                          setState(() {
                                            date = newDate;
                                            endDateController.text =
                                                '${date.year}-${date.month}-${date.day}';
                                          });
                                        },
                                        icon: Icon(Icons.calendar_month)),
                                  ),
                                  enabled: false,

                                  // border: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                  hintText: 'End Date',
                                  border: InputBorder.none),
                              // ),
                            ),
                          ),
                        ]),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   children: [
                    //     // Container(
                    //     //   padding: EdgeInsets.all(10),
                    //     //   // margin: EdgeInsets.fromLTRB(
                    //     //   //   0,
                    //     //   //   0,
                    //     //   //   0,
                    //     //   //   0,
                    //     //   // ),
                    //     //   height: 50,
                    //     //   width: 250,
                    //     //   decoration: BoxDecoration(
                    //     //     color: Colors.white,
                    //     //   ),
                    //     //   child:
                    //     Container(
                    //       child: Row(children: [
                    //         Container(
                    //           width: 400/2,
                    //           height: 40,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(0)),
                    //           child: TextField(
                    //             decoration: InputDecoration(
                    //                 prefixIcon: Image.asset('assets/search.png'),
                    //                 hintText: 'search...',
                    //                 border: InputBorder.none),
                    //           ),
                    //         ),
                    //       ]),
                    //       // ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Container(
                    //       width: 200/2,
                    //       decoration: BoxDecoration(
                    //         color: Color.fromARGB(255, 168, 233, 64),
                    //         borderRadius: BorderRadius.circular(0),
                    //       ),
                    //       // child: const TextField(
                    //       //           // obscureText: true,
                    //       //           decoration: InputDecoration(
                    //       //               fillColor: Color.fromARGB(255, 247, 252, 249),
                    //       //               filled: true,
                    //       //               suffixIcon: Icon(Icons.calendar_month),
                    //       //               enabled: true,

                    //       //               // border: OutlineInputBorder(
                    //       //               //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                    //       //               hintText: 'ALL',
                    //       //               border: InputBorder.none),
                    //       //         ),

                    //       // width: Get.width / 1.5,
                    //       height: 40,
                    //       child: DropdownButtonHideUnderline(
                    //         child: DropdownButton(
                    //           isExpanded: true,
                    //           hint: Row(
                    //             children: const [
                    //               SizedBox(
                    //                 width: 1,
                    //               ),
                    //               // Expanded(
                    //               //   child: Text(
                    //               //     '  Maritial Status',
                    //               //     style: TextStyle(
                    //               //       fontSize: 18,
                    //               //       fontWeight: FontWeight.bold,
                    //               //       color: Colors.grey,
                    //               //     ),
                    //               //     overflow: TextOverflow.ellipsis,
                    //               //   ),
                    //               // ),
                    //             ],
                    //           ),
                    //           items: all
                    //               .map((payment) => DropdownMenuItem<String>(
                    //                     value: payment,
                    //                     child: Text(
                    //                       "  " + payment,
                    //                       style: TextStyle(
                    //                           fontWeight: FontWeight.bold,
                    //                           color: Colors.grey,
                    //                           fontSize: 18),
                    //                       overflow: TextOverflow.ellipsis,
                    //                     ),
                    //                   ))
                    //               .toList(),
                    //           value: allValue,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _tripEditModalBottonSheet(context);
                    //               allValue = value as String;
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * .89,

                        // height: 50,
                        // width: 350/1,
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
                              children: [
                                Text(
                                  'Net Balance',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 65, 240, 80)),
                                ),
                                // Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                              ],
                            ),
                            // Text('₹'),
                            if (netbaldata?['Net_balance']
                                    .toString()
                                    .substring(1) !=
                                null)
                              Padding(
                                padding: const EdgeInsets.only(left: 170),
                                child: Row(
                                  children: [
                                    Text('₹'),
                                    Text(
                                      "${netbaldata['Net_balance'].toString().substring(1)}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ]),

                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * .89,
                        // width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                              ),
                            ]),
                        // height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Row(
                                children: [
                                  Text(
                                    'YOU GAVE',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                'YOU GOT',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: Get.height / 2,
                      // color: Colors.amber,

                      child: ListView.builder(
                          itemCount: baldata.length,
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
                                  //       builder: (context) => const home()),
                                  // );
                                }),
                                child: Container(
                                  // height: 60,
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
                                  child: Row(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width * .40,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 118, 218, 4),
                                                    child: Text(
                                                      "${baldata[index]['username'].toString()[0]}${baldata[index]['username'].toString()[1]}"
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    baldata[index]['username']
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          )),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 60,
                                                width: 100,
                                                color: Color.fromARGB(
                                                    255, 238, 211, 210),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Row(children: [
                                                    baldata[index][
                                                                'paid_amount'] ==
                                                            null
                                                        ? Text('')
                                                        : Text('₹',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .red)),
                                                    Text(
                                                      // baldata[index]['Quotation_amount']
                                                      //         ['total_amount__sum']
                                                      //     .toString(),
                                                      baldata[index]
                                                              ['paid_amount']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.red),
                                                    ),
                                                  ]),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(children: [
                                          // Container(
                                          //   height: 0,
                                          // ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Row(
                                              children: [
                                                baldata[index][
                                                            'Quotation_amount'] ==
                                                        null
                                                    ? Text('')
                                                    : Text(
                                                        '₹',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                Text(
                                                  // baldata[index]['paid_amount']
                                                  //         ['paid_amount__sum']
                                                  //     .toString(),
                                                  baldata[index]
                                                          ['Quotation_amount']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.width * .15,
                        // height: 50,
                        width: MediaQuery.of(context).size.width * .60,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ElevatedButton(
                          // color: Color.fromARGB(255, 2, 228, 119),
                          child: const Text(
                            'Download PDF',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          onPressed: () => openfile(
                              url: 'http://194.163.43.178:8000/report',
                              filename: 'report'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            )));
  }
}

int id = 1;
// int ids = 3;
String radioItem = '1';
int _value = 0;
// int _value1 = 1;
void _tripEditModalBottonSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * .43,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            Row(children: [
                              Text(
                                'Select report duration',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 27, 27, 27),
                                ),
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('This Month'),
                                      // SizedBox(
                                      //   width: 250,
                                      // ),
                                      SizedBox(
                                        width: 215,
                                      ),

                                      Radio(
                                        value: 0,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            var radioButtonItem = 'Yes';
                                            id = 0;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('This Week'),
                                    SizedBox(
                                      width: 220,
                                    ),
                                    Radio(
                                      value: 1,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          var radioButtonItem = 'Yes';
                                          id = 1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Highest Amount'),
                                  SizedBox(
                                    width: 185,
                                  ),
                                  Radio(
                                    value: 2,
                                    groupValue: id,
                                    onChanged: (val) {
                                      setState(() {
                                        var radioButtonItem = 'Yes';
                                        id = 2;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ]),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Least Amount'),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Radio(
                                      value: 3,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          var radioButtonItem = 'Yes';
                                          id = 3;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('oldest Amount'),
                                    SizedBox(
                                      width: 195,
                                    ),
                                    Radio(
                                      value: 4,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          var radioButtonItem = 'Yes';
                                          id = 4;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Newest Amount'),
                                    SizedBox(
                                      width: 190,
                                    ),
                                    Radio(
                                      value: 5,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          var radioButtonItem = 'Yes';
                                          id = 5;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ])))
                ],
              ),
            );
          }));
}
