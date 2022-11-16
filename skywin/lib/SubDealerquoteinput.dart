import 'package:flutter/material.dart';
// import 'package:irwin/redbus.dart';
import 'package:flutter/services.dart';
// import 'package:irwin/home.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

import 'package:fluttertoast/fluttertoast.dart';
// import 'package:irwin/adduser.dart';
// import 'Admininputpage.dart';
// import 'home.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:irwin/subdealerhome.dart';
import 'package:irwin/table.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:irwin/table.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:file_picker/file_picker.dart';

import 'farmer.dart';

// import 'SubDealerquoteinput.dart';
// import 'adminhome.dart';
// final TextEditingController tempCon = TextEditingController();
//   final TextEditingController hourCon = TextEditingController();
// void main(List<String> args) {
//   runApp(
//       MaterialApp(debugShowCheckedModeBanner: false, home: SubDealerquote()));
// }

var seletedDate;

TextEditingController GrossweightController = new TextEditingController();
TextEditingController GunnyBagsweightController = new TextEditingController();
TextEditingController RateController = new TextEditingController();
TextEditingController totalamontController = new TextEditingController();
TextEditingController NetweightController = new TextEditingController();
TextEditingController DateController = new TextEditingController();
TextEditingController RemarksController = new TextEditingController();


class SubDealerquote extends StatefulWidget {
  String userid;
  SubDealerquote({
    Key? key,
    this.userid = '',
  }) : super(key: key);

  @override
  State<SubDealerquote> createState() => _SubDealerquoteState();
}

class _SubDealerquoteState extends State<SubDealerquote> {
  final List<String> weight = [
    'Manual Weight',
    'Direct Weight',
  ];
  String? weightValue;
//   bool isopen = false;
// bool iscolse=true;
  DateTime date = DateTime(1900, 07, 28);
  // DateFormat now = new DateFormat.now();
  String time = '?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 236, 235, 235),
          // title: Text(
          //   'Total amt ₹ 1,50,000',
          //   style: TextStyle(
          //     fontSize: 23,
          //     color: Color.fromARGB(255, 65, 240, 80),
          //   ),
          // ),
          elevation: 0,
          leading: IconButton(
              icon: const Image(
                  image: const AssetImage(
                "assets/arrowback.png",
              )),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              }),

          //  actions: [
          //   IconButton(
          //       icon: Image(image: AssetImage("assets/bell.png")),
          //       onPressed: () {}),
          // ],
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // const Text(
                      //   'Sub dealer Name',
                      //   style: const TextStyle(fontSize: 20),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        // width: Get.width / 1.5,
                        // height: 50,
                        // child: DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     isExpanded: true,
                        //     hint: Row(
                        //       children: const [
                        //         SizedBox(
                        //           width: 4,
                        //         ),
                        //         // Expanded(
                        //         //   child: Text(
                        //         //     '  Maritial Status',
                        //         //     style: TextStyle(
                        //         //       fontSize: 18,
                        //         //       fontWeight: FontWeight.bold,
                        //         //       color: Colors.grey,
                        //         //     ),
                        //         //     overflow: TextOverflow.ellipsis,
                        //         //   ),
                        //         // ),
                        //       ],
                        //     ),
                        //     items: subdealer
                        //         .map((payment) => DropdownMenuItem<String>(
                        //               value: payment,
                        //               child: Text(
                        //                 "  " + payment,
                        //                 style: const TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.grey,
                        //                     fontSize: 18),
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ))
                        //         .toList(),
                        //     value: subdealerValue,
                        //     onChanged: (value) {
                        //       // setState(() {
                        //       //   subdealerValue = value as String;
                        //       // });
                        //       setState((){
                        //         subdealerValue = value as String;
                        //       }

                        //       );
                        //     },
                        //   ),
                        // ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      const SizedBox(height: 10),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Weight type",
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              // width: Get.width / 1.5,
                              //dropppp
                              // height: 50,
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
                                  items: weight
                                      .map((payment) =>
                                          DropdownMenuItem<String>(
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
                                  value: weightValue,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   weightValue = value as String;
                                    //   isopen = true;
                                    //   // iscolse=true;
                                    // }
                                    // );
                                    setState(() {
                                      weightValue = value as String;
                                      print(weightValue.toString());
                                      GrossweightController.clear();
                                      GunnyBagsweightController.clear();
                                      NetweightController.clear();
                                      RateController.clear();
                                      totalamontController.clear();
                                      DateController.clear();
                                      // isopen = true;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // if (isopen)
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            const SizedBox(
                              height: 10,
                            ),
                            weightValue.toString() != 'Manual Weight'
                                ? SizedBox()
                                : Text(
                                    'Manual Weight',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                            weightValue.toString() != 'Manual Weight'
                                ? SizedBox()
                                : SizedBox(
                                    height: 10,
                                  ),
                            weightValue.toString() != 'Manual Weight'
                                ? SizedBox()
                                : Container(
                                    child:
                                        // padding: EdgeInsets.all(15),
                                        GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    framer1())).then((value) {
                                          GrossweightController.text =
                                              gross.toStringAsFixed(3);
                                          GunnyBagsweightController.text =
                                              bags.toString();
                                          NetweightController
                                              .text = (double.parse(
                                                      GrossweightController
                                                              .text.isEmpty
                                                          ? ''
                                                          : GrossweightController
                                                              .text)-
                                                  int.parse(
                                                      GunnyBagsweightController
                                                              .text.isEmpty
                                                          ? ''
                                                          : GunnyBagsweightController
                                                              .text))
                                             .toStringAsFixed(3);
                                          print('jjjj' +
                                              NetweightController.text);
                                          setState(() {});
                                        });
                                      },
                                      child: new Container(
                                        width: 400,
                                        height: 50,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Container(
                                          padding: EdgeInsetsDirectional.only(
                                              bottom: 0),
                                          child: new Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(left: 10),
                                                  //   child: Text("Change Email"),
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 230,
                                                  // ),
                                                  IconButton(
                                                      icon: Icon(Icons
                                                          .arrow_forward_ios_rounded),
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (context) =>
                                                        //           framer()),
                                                        // );
                                                      })
                                                ])
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            // if (isopen)
                            Container(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  weightValue.toString() != 'Manual Weight'
                                      ? SizedBox()
                                      : Text(
                                          'Gross weight (KG)',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                  weightValue.toString() != 'Manual Weight'
                                      ? SizedBox()
                                      : SizedBox(
                                          height: 10,
                                        ),
                                  weightValue.toString() != 'Manual Weight'
                                      ? SizedBox()
                                      : Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 243, 241, 241),
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          // height: 50,
                                          child: TextFormField(
                                            // onChanged: (o) {
                                            //   setState(() {
                                            //     NetweightController
                                            //         .text = (int.parse(
                                            //                 GrossweightController
                                            //                         .text.isEmpty
                                            //                     ? '0'
                                            //                     : GrossweightController
                                            //                         .text) -
                                            //             int.parse(
                                            //                 GunnyBagsweightController
                                            //                         .text.isEmpty
                                            //                     ? '0'
                                            //                     : GunnyBagsweightController
                                            //                         .text))
                                            //         .toString();
                                            //   });
                                            // },
                                            controller: GrossweightController,

                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')
                                                  ),
                                            ],
                                            // obscureText: true,
                                            decoration: InputDecoration(
                                                fillColor: Color.fromARGB(
                                                    255, 247, 252, 249),
                                                filled: true,

                                                // border: OutlineInputBorder(
                                                //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                // hintText: 'User Type',
                                                border: InputBorder.none),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(0),
                                      margin: const EdgeInsets.all(0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            weightValue.toString() !=
                                                    'Manual Weight'
                                                ? SizedBox()
                                                : Text(
                                                    'Gunny Bags weight (KG)',
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                            weightValue.toString() !=
                                                    'Manual Weight'
                                                ? SizedBox()
                                                : SizedBox(
                                                    height: 10,
                                                  ),
                                            weightValue.toString() !=
                                                    'Manual Weight'
                                                ? SizedBox()
                                                : Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 243, 241, 241),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0)),
                                                    // height: 50,
                                                    child: TextFormField(
                                                      // onChanged: (o) {
                                                      //   setState(() {
                                                      //     NetweightController
                                                      //         .text = (int.parse(
                                                      //                 GrossweightController
                                                      //                         .text
                                                      //                         .isEmpty
                                                      //                     ? '0'
                                                      //                     : GrossweightController
                                                      //                         .text) -
                                                      //             int.parse(GunnyBagsweightController
                                                      //                     .text
                                                      //                     .isEmpty
                                                      //                 ? '0'
                                                      //                 : GunnyBagsweightController
                                                      //                     .text))
                                                      //         .toString();
                                                      //   });
                                                      // },
                                                      controller:
                                                          GunnyBagsweightController,

                                                      // obscureText: true,
                                                      decoration:
                                                          InputDecoration(
                                                              fillColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      247,
                                                                      252,
                                                                      249),
                                                              filled: true,

                                                              // border: OutlineInputBorder(
                                                              //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                              // hintText: 'User Type',
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                      keyboardType:
                                                          TextInputType.number,
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                margin: const EdgeInsets.all(0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      weightValue.toString() !=
                                                              'Manual Weight'
                                                          ? SizedBox()
                                                          : Text(
                                                              'Net Weight (KG)',
                                                              style: TextStyle(
                                                                  fontSize: 20),
                                                            ),
                                                      weightValue.toString() !=
                                                              'Manual Weight'
                                                          ? SizedBox()
                                                          : SizedBox(
                                                              height: 10,
                                                            ),
                                                      weightValue.toString() !=
                                                              'Manual Weight'
                                                          ? SizedBox()
                                                          : Container(
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      243,
                                                                      241,
                                                                      241),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              // height: 50,
                                                              child:
                                                                  TextFormField(
                                                                onChanged: (o) {
                                                                  setState(() {
                                                                    totalamontController
                                                                        .text = (double.parse(NetweightController.text.isEmpty ? '0' : NetweightController.text) *
                                                                            int.parse(RateController.text.isEmpty
                                                                                ? '0'
                                                                                : RateController.text))
                                                                        .toStringAsFixed(0);
                                                                  });
                                                                  NetweightController
                                                                      .clear();
                                                                },

                                                                controller:
                                                                    NetweightController,
                                                                // obscureText: true,
                                                                decoration:
                                                                    InputDecoration(
                                                                        fillColor: Color.fromARGB(
                                                                            255,
                                                                            247,
                                                                            252,
                                                                            249),
                                                                        filled:
                                                                            true,

                                                                        // border: OutlineInputBorder(
                                                                        //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                        // hintText: 'User Type',
                                                                        border:
                                                                            InputBorder.none),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                              ),
                                                            ),
                                                      //
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                weightValue.toString() !=
                                                                        'Manual Weight'
                                                                    ? SizedBox()
                                                                    : const Text(
                                                                        'Rate ₹',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                weightValue.toString() !=
                                                                        'Manual Weight'
                                                                    ? SizedBox()
                                                                    : const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                weightValue.toString() !=
                                                                        'Manual Weight'
                                                                    ? SizedBox()
                                                                    : Container(
                                                                        height:
                                                                            50,
                                                                        decoration: BoxDecoration(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                243,
                                                                                241,
                                                                                241),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0)),
                                                                        // height: 50,
                                                                        child:
                                                                            TextFormField(
                                                                          onChanged:
                                                                              (o) {
                                                                            setState(() {
                                                                              totalamontController.text = (double.parse
                                                                              (NetweightController.text.isEmpty ? '0' : 
                                                                              NetweightController.text) * int.parse
                                                                              (RateController.text.isEmpty ? '0' : RateController.text)).toStringAsFixed(0);
                                                                            });
                                                                          },
                                                                          controller:
                                                                              RateController,
                                                                          // obscureText: true,
                                                                          inputFormatters: <
                                                                              TextInputFormatter>[
                                                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                          ],
                                                                          decoration: InputDecoration(
                                                                              fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                              filled: true,

                                                                              // border: OutlineInputBorder(
                                                                              //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                              // hintText: 'User Type',
                                                                              border: InputBorder.none),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                        ),
                                                                      ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            0),
                                                                    margin: const EdgeInsets
                                                                        .all(0),
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          weightValue.toString() != 'Manual Weight'
                                                                              ? SizedBox()
                                                                              : const Text(
                                                                                  'total amont',
                                                                                  style: const TextStyle(fontSize: 20),
                                                                                ),
                                                                          weightValue.toString() != 'Manual Weight'
                                                                              ? SizedBox()
                                                                              : const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                          weightValue.toString() != 'Manual Weight'
                                                                              ? SizedBox()
                                                                              : Container(
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                  // height: 50,
                                                                                  child: TextFormField(
                                                                                    onChanged: (o) {
                                                                                      setState(() {
                                                                                        totalamontController.text = 
                                                                                        (double.parse(NetweightController.text.isEmpty ? '0' : 
                                                                                        NetweightController.text) * int.parse(RateController.text.isEmpty ? '0' : 
                                                                                        RateController.text)).toStringAsFixed(0);
                                                                                      });
                                                                                    },

                                                                                    controller: totalamontController,
                                                                                    // obscureText: true,
                                                                                    decoration: InputDecoration(
                                                                                        fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                        filled: true,

                                                                                        // border: OutlineInputBorder(
                                                                                        //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                        // hintText: 'User Type',
                                                                                        border: InputBorder.none),
                                                                                    keyboardType: TextInputType.number,
                                                                                  ),
                                                                                ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Container(
                                                                              padding: const EdgeInsets.all(0),
                                                                              margin: const EdgeInsets.all(0),
                                                                              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                                                weightValue.toString() != 'Manual Weight'
                                                                                    ? SizedBox()
                                                                                    : const Text(
                                                                                        'Date',
                                                                                        style: const TextStyle(fontSize: 20),
                                                                                      ),
                                                                                weightValue.toString() != 'Manual Weight'
                                                                                    ? SizedBox()
                                                                                    : const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                weightValue.toString() != 'Manual Weight'
                                                                                    ? SizedBox()
                                                                                    : Container(
                                                                                        height: 50,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          borderRadius: BorderRadius.circular(0),
                                                                                        ),
                                                                                        child: TextFormField(
                                                                                          readOnly: true,
                                                                                          controller: DateController,
                                                                                          decoration: InputDecoration(
                                                                                              fillColor: Colors.white,
                                                                                              contentPadding: EdgeInsets.all(13),
                                                                                              // labelText: '${date.year}/${date.month}/${date.day}',
                                                                                              // labelStyle: const TextStyle(fontSize: 16, fontFamily: "palatino", color: Colors.black),
                                                                                              // fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                              // filled: true,
                                                                                              suffixIcon: Align(
                                                                                                widthFactor: 1.0,
                                                                                                heightFactor: 1.0,
                                                                                                child: IconButton(
                                                                                                    onPressed: () async {
                                                                                                      DateTime? newDate = await showDatePicker(
                                                                                                        context: context,
                                                                                                        initialDate: DateTime.now(),
                                                                                                        firstDate: DateTime(1900),
                                                                                                        lastDate: DateTime.now(),
                                                                                                      );
                                                                                                      if (newDate == null) return;
                                                                                                      setState(() {
                                                                                                        date = newDate;
                                                                                                        DateController.text = DateFormat('yyyy-MM-dd').format(newDate);
                                                                                                      });
                                                                                                    },
                                                                                                    icon: Icon(Icons.calendar_month)),
                                                                                              ),
                                                                                              // enabled: false,

                                                                                              // border: OutlineInputBorder(
                                                                                              //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                              // hintText: 'User Type',
                                                                                              border: InputBorder.none),
                                                                                          // ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                                          height: 10,
                                                                                                        ),
                                                                                                        Container(
                                                                                                          padding: const EdgeInsets.all(0),
                                                                                                          margin: const EdgeInsets.all(0),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                            children: [
                                                                                                              weightValue.toString() != 'Manual Weight'
                                                                                                                  ? SizedBox()
                                                                                                                  : const Text(
                                                                                                                      'Remark',
                                                                                                                      style: const TextStyle(fontSize: 20),
                                                                                                                    ),
                                                                                                              weightValue.toString() != 'Manual Weight'
                                                                                                                  ? SizedBox()
                                                                                                                  : const SizedBox(
                                                                                                                      height: 10,
                                                                                                                    ),
                                                                                                              weightValue.toString() != 'Manual Weight'
                                                                                                                  ? SizedBox()
                                                                                                                  : Container(
                                                                                                                      height: 50,
                                                                                                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                                                      
                                                                                                                      child: TextFormField(
                                                                                                                        controller: RemarksController,
                                                                                                                        // obscureText: true,
                                                                                                                        decoration: InputDecoration(
                                                                                                                          
                                                                                                                            fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                                                            filled: true,

                                                                                                                            // border: OutlineInputBorder(
                                                                                                                            //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                                                            // hintText: 'User Type',
                                                                                                                            border: InputBorder.none),
                                                                                                                            
                                                                                                                        // keyboardType: TextInputType.number,
                                                                                                                      ),
                                                                                                                    ),
                                                                                // SizedBox(
                                                                                //   height: 0,
                                                                                // ),
                                                                                // Container(
                                                                                //   padding: const EdgeInsets.all(0),
                                                                                //   margin: const EdgeInsets.all(0),
                                                                                //   child: Column(
                                                                                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                //     children: [
                                                                                //       weightValue.toString() != 'Direct Weight'
                                                                                //           ? SizedBox()
                                                                                //           : Text(
                                                                                //               'Direct weight',
                                                                                //               style: TextStyle(fontSize: 20),
                                                                                //             ),
                                                                                //       weightValue.toString() != 'Direct Weight'
                                                                                //           ? SizedBox()
                                                                                //           : SizedBox(
                                                                                //               height: 10,
                                                                                //             ),
                                                                                //       weightValue.toString() != 'Direct Weight'
                                                                                //           ? SizedBox()
                                                                                //           : Container(
                                                                                //               height: 50,
                                                                                //               decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                //               // height: 50,
                                                                                //               child: TextFormField(
                                                                                //                 // onChanged: (o) {
                                                                                //                 //   setState(() {
                                                                                //                 //     totalamontController.text = (int.parse(
                                                                                //                 //       NetweightController.text.isEmpty ?
                                                                                //                 //       '0' : NetweightController.text) *
                                                                                //                 //        int.parse(RateController.text.isEmpty ?
                                                                                //                 //        '0' : RateController.text)).toString();
                                                                                //                 //   });
                                                                                //                 //   NetweightController.clear();
                                                                                //                 // },

                                                                                //                 controller: DirectWeightController,
                                                                                //                 // obscureText: true,
                                                                                //                 decoration: InputDecoration(
                                                                                //                     fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                //                     filled: true,

                                                                                //                     // border: OutlineInputBorder(
                                                                                //                     //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                //                     // hintText: 'User Type',
                                                                                //                     border: InputBorder.none),
                                                                                //                 keyboardType: TextInputType.number,
                                                                                //               ),
                                                                                //             ),

                                                                                //  SizedBox(
                                                                                //   height: 0,
                                                                                // ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Container(
                                                                                    padding: const EdgeInsets.all(0),
                                                                                    margin: const EdgeInsets.all(0),
                                                                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                                                      weightValue.toString() != 'Direct Weight'
                                                                                          ? SizedBox()
                                                                                          : Text(
                                                                                              'Net Weight (KG)',
                                                                                              style: TextStyle(fontSize: 20),
                                                                                            ),
                                                                                      weightValue.toString() != 'Direct Weight'
                                                                                          ? SizedBox()
                                                                                          : SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                      weightValue.toString() != 'Direct Weight'
                                                                                          ? SizedBox()
                                                                                          : Container(
                                                                                              height: 50,
                                                                                              decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                              // height: 50,
                                                                                              child: TextFormField(
                                                                                                onChanged: (o) {
                                                                                                  setState(() {
                                                                                                    totalamontController.text = (double.parse(NetweightController.text.isEmpty ? '0' : NetweightController.text) * int.parse(RateController.text.isEmpty ? '0' : RateController.text)).toStringAsFixed(0);
                                                                                                  });
                                                                                                  // NetweightController.clear();
                                                                                                },

                                                                                                controller: NetweightController,
                                                                                                // obscureText: true,
                                                                                                decoration: InputDecoration(
                                                                                                    fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                                    filled: true,

                                                                                                    // border: OutlineInputBorder(
                                                                                                    //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                                    // hintText: 'User Type',
                                                                                                    border: InputBorder.none),
                                                                                                keyboardType: TextInputType.number,
                                                                                              ),
                                                                                            ),
                                                                                      //     //
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      Container(
                                                                                          padding: const EdgeInsets.all(0),
                                                                                          margin: const EdgeInsets.all(0),
                                                                                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                                                            weightValue.toString() != 'Direct Weight'
                                                                                                ? SizedBox()
                                                                                                : const Text(
                                                                                                    'Rate ₹',
                                                                                                    style: const TextStyle(fontSize: 20),
                                                                                                  ),
                                                                                            weightValue.toString() != 'Direct Weight'
                                                                                                ? SizedBox()
                                                                                                : const SizedBox(
                                                                                                    height: 10,
                                                                                                  ),
                                                                                            weightValue.toString() != 'Direct Weight'
                                                                                                ? SizedBox()
                                                                                                : Container(
                                                                                                    height: 50,
                                                                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                                    // height: 50,
                                                                                                    child: TextFormField(
                                                                                                      onChanged: (o) {
                                                                                                        setState(() {
                                                                                                          totalamontController.text = (double.parse(NetweightController.text.isEmpty ?
                                                                                                           '0' : NetweightController.text) * 
                                                                                                           int.parse(RateController.text.isEmpty ? '0' : RateController.text)).toStringAsFixed(0);
                                                                                                        });
                                                                                                      },
                                                                                                      controller: RateController,
                                                                                                      // obscureText: true,
                                                                                                      inputFormatters: <TextInputFormatter>[
                                                                                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                                                      ],
                                                                                                      decoration: InputDecoration(
                                                                                                          fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                                          filled: true,

                                                                                                          // border: OutlineInputBorder(
                                                                                                          //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                                          // hintText: 'User Type',
                                                                                                          border: InputBorder.none),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                    ),
                                                                                                  ),
                                                                                            SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            Container(
                                                                                              padding: const EdgeInsets.all(0),
                                                                                              margin: const EdgeInsets.all(0),
                                                                                              child: Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                children: [
                                                                                                  weightValue.toString() != 'Direct Weight'
                                                                                                      ? SizedBox()
                                                                                                      : const Text(
                                                                                                          'total amont',
                                                                                                          style: const TextStyle(fontSize: 20),
                                                                                                        ),
                                                                                                  weightValue.toString() != 'Direct Weight'
                                                                                                      ? SizedBox()
                                                                                                      : const SizedBox(
                                                                                                          height: 10,
                                                                                                        ),
                                                                                                  weightValue.toString() != 'Direct Weight'
                                                                                                      ? SizedBox()
                                                                                                      : Container(
                                                                                                          height: 50,
                                                                                                          decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                                          // height: 50,
                                                                                                          child: TextFormField(
                                                                                                            controller: totalamontController,
                                                                                                            // obscureText: true,
                                                                                                            decoration: InputDecoration(
                                                                                                                fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                                                filled: true,

                                                                                                                // border: OutlineInputBorder(
                                                                                                                //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                                                // hintText: 'User Type',
                                                                                                                border: InputBorder.none),
                                                                                                            keyboardType: TextInputType.number,
                                                                                                          ),
                                                                                                        ),
                                                                                                  SizedBox(
                                                                                                    height: 10,
                                                                                                  ),
                                                                                                  // Row(
                                                                                                  //     mainAxisAlignment:
                                                                                                  //         MainAxisAlignment
                                                                                                  //             .spaceBetween,
                                                                                                  //     children: [
                                                                                                  //       InkWell(
                                                                                                  //         onTap: () async {
                                                                                                  //           DateTime?
                                                                                                  //               newDate =
                                                                                                  //               await showDatePicker(
                                                                                                  //             context:
                                                                                                  //                 context,
                                                                                                  //             initialDate:
                                                                                                  //                 date,
                                                                                                  //             firstDate:
                                                                                                  //                 DateTime(
                                                                                                  //                     1900),
                                                                                                  //             lastDate:
                                                                                                  //                 DateTime(
                                                                                                  //                     2100),
                                                                                                  //           );
                                                                                                  //           if (newDate ==
                                                                                                  //               null)
                                                                                                  //             return;
                                                                                                  //           setState(() {
                                                                                                  //             date =
                                                                                                  //                 newDate;
                                                                                                  //             seletedDate =
                                                                                                  //                 '${date.day}/${date.month}/${date.year}';
                                                                                                  //             print(seletedDate
                                                                                                  //                 .toString());
                                                                                                  //           });
                                                                                                  //         },
                                                                                                  // child:
                                                                                                  Container(
                                                                                                    padding: const EdgeInsets.all(0),
                                                                                                    margin: const EdgeInsets.all(0),
                                                                                                    child: Column(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                      children: [
                                                                                                        weightValue.toString() != 'Direct Weight'
                                                                                                            ? SizedBox()
                                                                                                            : const Text(
                                                                                                                'Date',
                                                                                                                style: const TextStyle(fontSize: 20),
                                                                                                              ),
                                                                                                        weightValue.toString() != 'Direct Weight'
                                                                                                            ? SizedBox()
                                                                                                            : const SizedBox(
                                                                                                                height: 10,
                                                                                                              ),
                                                                                                        weightValue.toString() != 'Direct Weight'
                                                                                                            ? SizedBox()
                                                                                                            : Container(
                                                                                                                height: 50,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Colors.white,
                                                                                                                  borderRadius: BorderRadius.circular(0),
                                                                                                                ),
                                                                                                                child: TextFormField(
                                                                                                                  readOnly: true,
                                                                                                                  controller: DateController,
                                                                                                                  decoration: InputDecoration(
                                                                                                                      fillColor: Colors.white,
                                                                                                                      contentPadding: EdgeInsets.all(13),
                                                                                                                      // labelText: '${date.year}/${date.month}/${date.day}',
                                                                                                                      // labelStyle: const TextStyle(fontSize: 16, fontFamily: "palatino", color: Colors.black),
                                                                                                                      // fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                                                      // filled: true,
                                                                                                                      suffixIcon: Align(
                                                                                                                        widthFactor: 1.0,
                                                                                                                        heightFactor: 1.0,
                                                                                                                        child: IconButton(
                                                                                                                            onPressed: () async {
                                                                                                                              DateTime? newDate = await showDatePicker(
                                                                                                                                context: context,
                                                                                                                                initialDate: DateTime.now(),
                                                                                                                                firstDate: DateTime(1900),
                                                                                                                                lastDate: DateTime.now(),
                                                                                                                              );
                                                                                                                              if (newDate == null) return;
                                                                                                                              setState(() {
                                                                                                                                date = newDate;
                                                                                                                                DateController.text = DateFormat('yyyy-MM-dd').format(newDate);
                                                                                                                              });
                                                                                                                            },
                                                                                                                            icon: Icon(Icons.calendar_month)),
                                                                                                                      ),
                                                                                                                      // enabled: false,

                                                                                                                      // border: OutlineInputBorder(
                                                                                                                      //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                                                      // hintText: 'User Type',
                                                                                                                      border: InputBorder.none),
                                                                                                                ),
                                                                                                              ),
                                                                                                              SizedBox(
                                                                                                          height: 10,
                                                                                                        ),
                                                                                                        Container(
                                                                                                          padding: const EdgeInsets.all(0),
                                                                                                          margin: const EdgeInsets.all(0),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                            children: [
                                                                                                              weightValue.toString() != 'Direct Weight'
                                                                                                                  ? SizedBox()
                                                                                                                  : const Text(
                                                                                                                      'Remark',
                                                                                                                      style: const TextStyle(fontSize: 20),
                                                                                                                    ),
                                                                                                              weightValue.toString() != 'Direct Weight'
                                                                                                                  ? SizedBox()
                                                                                                                  : const SizedBox(
                                                                                                                      height: 10,
                                                                                                                    ),
                                                                                                              weightValue.toString() != 'Direct Weight'
                                                                                                                  ? SizedBox()
                                                                                                                  : Container(
                                                                                                                      height: 50,
                                                                                                                      decoration: BoxDecoration(color: const Color.fromARGB(255, 243, 241, 241), borderRadius: BorderRadius.circular(0)),
                                                                                                                      
                                                                                                                      child: TextFormField(
                                                                                                                        controller: RemarksController,
                                                                                                                        // obscureText: true,
                                                                                                                        decoration: InputDecoration(
                                                                                                                          
                                                                                                                            fillColor: Color.fromARGB(255, 247, 252, 249),
                                                                                                                            filled: true,

                                                                                                                            // border: OutlineInputBorder(
                                                                                                                            //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                                                                                                            // hintText: 'User Type',
                                                                                                                            border: InputBorder.none),
                                                                                                                            
                                                                                                                        // keyboardType: TextInputType.number,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                        //             )
                                                                                                        //     ],
                                                                                                        //   ),
                                                                                                        // ),
                                                                                                        //       ])
                                                                                                        //        ) ])
                                                                                                        //             // ]
                                                                                                        //             ),
                                                                                                        //         // )
                                                                                                        //       ]),
                                                                                                        //     )
                                                                                                        //   ]),
                                                                                                        // ),
                                                                                                        // const SizedBox(
                                                                                                        //   height: 10,
                                                                                                        // ),
                                                                                                        // Container(
                                                                                                        //   padding:
                                                                                                        //       const EdgeInsets.symmetric(horizontal: 160),
                                                                                                        //   child: Row(children: [
                                                                                                        //     const Text(
                                                                                                        //       "OR",
                                                                                                        //       style: TextStyle(
                                                                                                        //         fontSize: 20.0,
                                                                                                        //       ),
                                                                                                        //     ),
                                                                                                        //     // Icon(
                                                                                                        //     //   Icons.arrow_forward,
                                                                                                        //     //   color: Colors.green,
                                                                                                        //     // ),
                                                                                                        //   ]),
                                                                                                        // ),
                                                                                                        // const SizedBox(
                                                                                                        //   height: 20,
                                                                                                        // ),
                                                                                                        // Container(
                                                                                                        //     height: 50,
                                                                                                        //     width: 5,
                                                                                                        //     padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                                                                                                        //     child: ElevatedButton.icon(
                                                                                                        //       icon: Icon(
                                                                                                        //         Icons.camera_enhance,
                                                                                                        //         color: Colors.green,
                                                                                                        //         size: 30.0,
                                                                                                        //       ),
                                                                                                        //       label: Text(
                                                                                                        //         'Attach Bill',
                                                                                                        //         style: TextStyle(fontSize: 17, color: Colors.white),
                                                                                                        //       ),
                                                                                                        //       onPressed: () {
                                                                                                        //         // Share.share('Hello Welcome to FlutterCampus', subject: 'Welcome Message');
                                                                                                        //       },
                                                                                                        //       style: ElevatedButton.styleFrom(
                                                                                                        //         shape: new RoundedRectangleBorder(
                                                                                                        //           borderRadius: new BorderRadius.circular(0.0),
                                                                                                        //         ),
                                                                                                        //       ),
                                                                                                        //     )),
                                                                                                        SizedBox(
                                                                                                          height: 40,
                                                                                                        ),
                                                                                                        // weightValue.toString() != 'Manual Weight'
                                                                                                        //                         ? SizedBox()
                                                                                                        //                         :
                                                                                                        Container(
                                                                                                          height: 50,
                                                                                                          width: 110,
                                                                                                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                                                                                                          child: ElevatedButton(
                                                                                                              // color: const Color.fromARGB(
                                                                                                              //     255, 2, 228, 119),
                                                                                                              child: const Text(
                                                                                                                'Submit',
                                                                                                                style: TextStyle(fontSize: 17, color: Colors.white),
                                                                                                              ),
                                                                                                              onPressed: () {
                                                                                                                if (DateController.text.isEmpty) {
                                                                                                                  Fluttertoast.showToast(msg: 'Enter date');
                                                                                                                } else if (weightValue.toString() == 'null') {
                                                                                                                  Fluttertoast.showToast(msg: 'weighttype Enter Value');
                                                                                                                } else if (NetweightController.text.isEmpty) {
                                                                                                                  Fluttertoast.showToast(msg: 'Netweigh Enter Value');
                                                                                                                } else if (RateController.text.isEmpty) {
                                                                                                                  Fluttertoast.showToast(msg: 'Rate Enter Value');
                                                                                                                } else if (totalamontController.text.isEmpty) {
                                                                                                                  Fluttertoast.showToast(msg: 'totalamont Enter Value');
                                                                                                                }
                                                                                                                else if (RemarksController.text.isEmpty) {
                                                                                                                  Fluttertoast.showToast(msg: 'Remarks Enter Value');
                                                                                                                } else {
                                                                                                                  if (weightValue == 'Manual Weight') {
                                                                                                                    if (GrossweightController.text.isEmpty) {
                                                                                                                      Fluttertoast.showToast(msg: 'Grossweight Enter Value');
                                                                                                                    } else if (GunnyBagsweightController.text.isEmpty) {
                                                                                                                      Fluttertoast.showToast(msg: 'GunnyBagsweigh Enter Value');
                                                                                                                    } else {
                                                                                                                      loginapi(
                                                                                                                        DateController.text,
                                                                                                                        weightValue,
                                                                                                                        NetweightController.text,
                                                                                                                        RateController.text,
                                                                                                                        totalamontController.text,
                                                                                                                        GrossweightController.text,
                                                                                                                        GunnyBagsweightController.text,
                                                                                                                        RemarksController.text,
                                                                                                                      );
                                                                                                                    }
                                                                                                                  } else {
                                                                                                                    loginapi(
                                                                                                                      DateController.text,
                                                                                                                      weightValue,
                                                                                                                      NetweightController.text,
                                                                                                                      RateController.text,
                                                                                                                      totalamontController.text,
                                                                                                                      null,
                                                                                                                      null,
                                                                                                                      RemarksController.text,
                                                                                                                    );
                                                                                                                  }

                                                                                                                  print(weightValue);
                                                                                                                  DateController.clear();
                                                                                                                  NetweightController.clear();
                                                                                                                  RateController.clear();
                                                                                                                  totalamontController.clear();
                                                                                                                  GrossweightController.clear();
                                                                                                                  GunnyBagsweightController.clear();
                                                                                                                  RemarksController.clear();
                                                                                                                }

                                                                                                                // print(nameController.text);
                                                                                                                // print(passwordController.text);
                                                                                                              }),
                                                                                                        ),
                                                                                                        // const SizedBox(
                                                                                                        //   height: 40,
                                                                                                        // ),
                                                                                                        //  weightValue.toString() != 'Direct Weight'
                                                                                                        //                         ? SizedBox()
                                                                                                        //                         :
                                                                                                        //                         Container(
                                                                                                        //   height: 50,
                                                                                                        //   width: 110,

                                                                                                        //   padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                                                                                                        //   child:
                                                                                                        //   ElevatedButton(
                                                                                                        //       // color: const Color.fromARGB(
                                                                                                        //       //     255, 2, 228, 119),
                                                                                                        //       child:
                                                                                                        //       const Text(
                                                                                                        //         'Submit',
                                                                                                        //         style: TextStyle(fontSize: 17, color: Colors.white),
                                                                                                        //       ),
                                                                                                        //       onPressed: () {
                                                                                                        //         if (weightValue.toString() == 'null') {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter categeri');
                                                                                                        //         } else if (GrossweightController.text.isEmpty) {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter Value');
                                                                                                        //         } else if (GunnyBagsweightController.text.isEmpty) {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter Value');
                                                                                                        //         } else if (NetweightController.text.isEmpty) {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter Value');
                                                                                                        //         } else if (RateController.text.isEmpty) {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter Value');
                                                                                                        //         } else if (totalamontController.text.isEmpty) {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter Value');
                                                                                                        //         } else if (DateController.text.isEmpty) {
                                                                                                        //           Fluttertoast.showToast(msg: 'Enter date');
                                                                                                        //         } else {
                                                                                                        //           loginapi(
                                                                                                        //             weightValue,

                                                                                                        //             netweightController.text,
                                                                                                        //             rateController.text,
                                                                                                        //             TotalamontController.text,
                                                                                                        //             dateController.text,
                                                                                                        //           );
                                                                                                        //           print(weightValue);
                                                                                                        //           TotalamontController.clear();
                                                                                                        //           rateController.clear();
                                                                                                        //           netweightController.clear();

                                                                                                        //           dateController.clear();

                                                                                                        //         }

                                                                                                        //         // print(nameController.text);
                                                                                                        //         // print(passwordController.text);
                                                                                                        //       }),
                                                                                                        // ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            )
                                                                                          ]))
                                                                                    ]))
                                                                              ]))
                                                                        ]))
                                                              ]))
                                                    ]))
                                          ]))
                                ]))
                          ]))
                    ]))]))]))));

    //                           )
    //                     ]))
    //               ])));
    // }
  }

  var baseurl = 'http://194.163.43.178:8000';

  void loginapi(
    date,
    Weighttype,
    Netweight,
    Rate,
    totalamont,
    Grossweight,
    GunnyBagsweight,
    remarks,
  ) async {
    var id = widget.userid;
    print('ddddd' + date.toString());

    var url = Uri.parse('$baseurl/Quotation/');
    final response = await http.post(url, body: <String, String>{
      'date': date,
      'weight_type': Weighttype,
      'net_weight': Netweight,
      'rate': Rate,
      'total_amount': totalamont,
      'gross_weight': Grossweight ?? '',
      'gunny_bag_weight': GunnyBagsweight ?? '',
      'remarks':remarks,
      'user': id.toString(),
    });

    var data = json.decode(response.body);
    if (data['status'] == 'success') {
      Get.back();
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
    print(response.body.toString());
  }
}
