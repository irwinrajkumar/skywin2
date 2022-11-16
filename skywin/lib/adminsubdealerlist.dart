import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:custom_switch/custom_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:irwin/adminhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// import 'adminprofile.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
// var name;

var mobilenum;
var lastname;

class subdealerlist extends StatefulWidget {
  // String userid;
  const subdealerlist({Key? key,}) : super(key: key);

  @override
  State<subdealerlist> createState() => _subdealerlistState();
}

List<bool> _value = [];

// bool status = false;
// bool status1 = false;
// bool status2 = false;

class _subdealerlistState extends State<subdealerlist> {
  @override
  void initState() {
    admindata();

    super.initState();
  }

  var fetchdata = [];
  var ad_banner = [];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 237, 237),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 237, 237),
          elevation: 0,

          title: TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const adminprofile()),
              // );
            },
            child: Text(
              "Subdealer List",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 107, 236, 56)),
            ),
          ),
          leading: IconButton(
              icon: Image(
                  image: AssetImage(
                "assets/arrowback.png",
              )),
              onPressed: () {
                Navigator.pop((context));
              }),

          // actions: [
          //   new IconButton(
          //       icon: new Image.asset('assets/person.png'),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => const adduser()
          //           ),
          //         );
          //       }),
          // ],
        ),
        body: Container(
            height: 800 / 1,
            // width: 360,
            child: ListView.builder(
                itemCount: fetchdata.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
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
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                        height: 75,
                                      ),
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 118, 218, 4),
                                        child:lastname != null
                                                          ?  Text(
                                                            // "${lastname[0]}${lastname[1]}".toUpperCase(),
                                          "${fetchdata[index]['username'].toString()[0]}${fetchdata[index]['username'].
                                          toString()[1]}".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ): Container()
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        fetchdata[index]["username"].toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 51, 50, 50)),
                                      ),
                                    ],
                                  ),
                                  _value[index] != null
                                      ? Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: FlutterSwitch(
                                            width: 60.0,
                                            height: 30.0,
                                            valueFontSize: 12.0,
                                            toggleSize: 20.0,
                                            value: _value[index],
                                            borderRadius: 30.0,
                                            padding: 8.0,
                                            showOnOff: true,
                                            onToggle: (bool value) {
                                              print(value);

                                              setState(() {
                                                if (value == false) {
                                                  _value[index] = false;
                                                } else {
                                                  _value[index] = true;
                                                } // setState(() {

                                                //   status = val;
                                                // });
                                              });
                                            },
                                          ),
                                      )
                                      : Container(),
                                ],
                              ),
                            ),
                          ))
                    ],
                  );
                })));
  }

  Future<void> admindata() async {
    // var id = widget.userid;
    var url = "http://194.163.43.178:8000/SubdealerList/";
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

    var decodeValue = json.decode(res.body);
    setState(() {
      fetchdata = decodeValue["data"];
      // mobilenum = decodeValue['data']['mobile'];
      // lastname = decodeValue['data']['username'];

      for (int i = 0; i < fetchdata.length; i++) {
        _value.add(false);
      }

      //  ad_banner=decodeValue['data']['username'];
    });
    // }
  }
}
