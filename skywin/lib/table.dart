import 'package:flutter/material.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// import 'package:example/pages/custom_data_table.dart';
// import 'package:example/pages/local_table.dart';
// import 'pages/custom_column_nested_table.dart';
// import 'pages/custom_column_table.dart';
// import 'pages/simple_table.dart';

// import 'mainpage.dart';
// import 'myaccountpage.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'framertable/text.dart';
// import 'orange.tile.dart';
// import 'text.dart';
// import 'package:tanmiah/controller/auth.dart';
// import 'package:tanmiah/widgets/orange_tile.dart';

// import '../../widgets/text.dart'

// var rng = new Random();
// var code = rng.nextInt(900000) + 100000;
double gross = 0;
int bags = 0;

class framer1 extends StatefulWidget {
  const framer1({Key? key}) : super(key: key);

  @override
  State<framer1> createState() => _framer1State();
}

class _framer1State extends State<framer1> {
  final TextEditingController tempCon = TextEditingController();
  final TextEditingController hourCon = TextEditingController();
  // final con = Get.find();
  var tempList = [];
  // var hourList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 237, 237),
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
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),

                    // Text(
                    //   'Farmername',
                    //   style: TextStyle(color: Colors.white, fontSize: 18),
                    // ),

                    // SizedBox(
                    //   width: 100,
                    //   child: TextField(
                    //     decoration: new InputDecoration.collapsed(
                    //         hintText: 'Farmername'),
                    //   ),
                    // ),
                  ]),
            ),
            backgroundColor: Color.fromARGB(255, 0, 123, 255),
            // elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'Gross weight',
                        color: Colors.blue,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 235, 235),
                            border: Border.all(
                              color: Color.fromARGB(255, 226, 195, 195),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: tempCon,
                            maxLength: 7,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]')),
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'kg',
                                hintStyle: txtStyle(16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'bags weight',
                        color: Colors.blue,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 235, 235),
                            border: Border.all(
                              color: Color.fromARGB(255, 226, 195, 195),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            maxLength: 5,
                            controller: hourCon,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'kg',
                                hintStyle: txtStyle(16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Txt(
                      text: '',
                      color: Colors.blue,
                      weight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        if (tempCon.text.isEmpty || hourCon.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter both values');
                        } else {
                          setState(() {
                            tempList.add({
                              'bags': int.parse(hourCon.text),
                              'Gross': double.parse(tempCon.text)
                            });
                            gross = 0;
                            for (int i = 0; i < tempList.length; i++) {
                              gross += tempList[i]["Gross"];
                            }
                            bags = 0;
                            for (int i = 0; i < tempList.length; i++) {
                              bags = tempList[i]["bags"];
                            }

                            hourCon.clear();
                            tempCon.clear();
                          });
                          print(tempList.toString());
                        }
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Center(
                            child: Txt(
                              text: 'ADD',
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                // Txt(
                //   text: 'Recorded Temperature',
                //   weight: FontWeight.bold,
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Txt(
                                    text: 'bags',
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0))),
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: tempList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Txt(
                                            text:
                                            tempList[index]['bags']
                                                .toString(),
                                            color: Colors.black87,
                                            weight: FontWeight.normal,
                                          )
                                        ],
                                      ),
                                      height: 50,
                                      width: 76,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black87)),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Txt(
                          text: 'Gross',
                          color: Colors.black87,
                          weight: FontWeight.normal,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87)),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: tempList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Txt(
                                  text: double.parse(tempList[index]['Gross'].toString()).toStringAsFixed(3),
                                  color: Colors.black87,
                                  weight: FontWeight.normal,
                                )
                              ],
                            ),
                            height: 50,
                            width: 76,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87)),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green // background
                        // onPrimary: Colors.yellow, // foreground
                        ),
                    // color: const Color.fromARGB(
                    // 255, 2, 228, 119),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           SubDealerquote(
                      //               // userid: widget.userid,
                      //               )),
                      // );
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
            //     Row(
            //       children: [
            //         Expanded(
            //           child: Container(
            //   color:Colors.amber,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            //     child: Txt(
            //       text: 'Feed Consumption',
            //       color: Colors.white,
            //       weight: FontWeight.bold,
            //       fsize: 17,
            //     ),
            //   ),
            // )

            //           ),

            //       ],
            //     ),
          ]),
        ),
      ),
    );
  }
}
