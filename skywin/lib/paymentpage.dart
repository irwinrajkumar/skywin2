import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'subdealerquate.dart';
// import 'package:irwin/adminprofile.dart';

// import 'adminhome.dart';
// import 'package:irwin/redbus.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }
TextEditingController paymentController = new TextEditingController();
TextEditingController dateController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController RemarksController = new TextEditingController();

class payment extends StatefulWidget {
  String userid;
  payment({Key? key, this.userid = ''}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

// final List<String> all = [
//   'All',
// ];
// String? allValue;
DateTime date = DateTime(1900, 07, 28);
// DateTime selectedDate = DateTime.now();
String time = '?';

class _paymentState extends State<payment> {
  @override
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
                        width: 60,
                      ),
                      Text(
                        'Paid to Subdealer',
                        style: TextStyle(
                          fontSize: 23,
                          color: Color.fromARGB(255, 65, 240, 80),
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 41, 6, 241),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: paymentController,
                    // initialValue: '+91  ',
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixText: '₹',
                      prefixStyle: TextStyle(color: Colors.red),
                      fillColor: Color.fromARGB(255, 247, 252, 249),
                      filled: true,

                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                      hintText: ' Enter payment amonts',
                      // border: InputBorder.none
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 41, 6, 241),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    // initialValue: '+91  ',
                    // autofocus: false,
                    decoration: InputDecoration(
                      // prefixText: '₹',
                      // prefixStyle: TextStyle(color: Colors.red),
                      fillColor: Color.fromARGB(255, 247, 252, 249),
                      filled: true,

                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                      hintText: ' Name',
                      // border: InputBorder.none
                    ),
                    // keyboardType: TextInputType.number,
                  ),
                ),
                // Container(

                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       //   weightValue.toString() !=
                //       //     'Direct Weight'
                //       // ? SizedBox()
                //       // :
                //       const Text(
                //         'Date',
                //         style: const TextStyle(fontSize: 20),
                //       ),
                //       //    weightValue.toString() !=
                //       //     'Direct Weight'
                //       // ? SizedBox()
                //       // :
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       //    weightValue.toString() !=
                //       //     'Direct Weight'
                //       // ? SizedBox()
                // :
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextFormField(
                          enabled: true,
                          controller: dateController,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(13),
                              // labelText: '${date.year}/${date.month}/${date.day}',
                              // labelStyle: const TextStyle(fontSize: 16, fontFamily: "palatino", color: Colors.black),
                              // fillColor: Color.fromARGB(255, 247, 252, 249),
                              // filled: true,
                              suffixIcon: Align(
                                widthFactor: 0.0,
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
                                        dateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(newDate);
                                      });
                                    },
                                    icon: Icon(Icons.calendar_month)),
                              ),
                              // enabled: false,

                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                              hintText: 'Date',
                              border: InputBorder.none),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(0),
                      //   margin: const EdgeInsets.all(0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.stretch,
                      //     children: [
                      //       const Text(
                      //         'Remark',
                      //         style: const TextStyle(fontSize: 20),
                      //       ),
                      //       const SizedBox(
                      //         height: 10,
                      //       ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 243, 241, 241),
                                  borderRadius: BorderRadius.circular(0)),
                              child: TextFormField(
                                controller: RemarksController,
                                // obscureText: true,
                                decoration: InputDecoration(
                                    fillColor:
                                        Color.fromARGB(255, 247, 252, 249),
                                    filled: true,

                                    // border: OutlineInputBorder(
                                    //   borderSide: BorderSide(color: Color.fromARGB(255, 241, 233, 233),width: 1),
                                    hintText: 'Remarks',
                                    border: InputBorder.none),

                                // keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 390,
                            ),
                            Container(
                              // height: 50,
                              width: 350,
                              // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // background
                                  // onPrimary: Colors.yellow, // foreground
                                ),
                                // color: const Color.fromARGB(
                                // 255, 2, 228, 119),
                                child: const Text(
                                  'SAVE',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                onPressed: () {
                                  if (paymentController.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Enter value');
                                  } else if (nameController.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Enter name');
                                  } else if (dateController.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Enter date');
                                  } else if (RemarksController.text.isEmpty) {
                                    Fluttertoast.showToast(msg: 'Remarks date');
                                  } 
                                  else {
                                    loginapi(
                                      // weightValue,
                                      paymentController.text,
                                      nameController.text,
                                      dateController.text,
                                      RemarksController.text,
                                    );
                                    print(loginapi);
                                    paymentController.clear();
                                    nameController.clear();
                                    dateController.clear();
                                    RemarksController.clear();
                                  }

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const payment()),
                                  // ); // print(nameController.text);
                                  // print(passwordController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        )));
            
  }

  var baseurl = 'http://194.163.43.178:8000';
  void loginapi(
    paidamount,
    farmername,
    date,
    remarks,
  ) async {
    var id = widget.userid;
    print(id);
    print('ddddd' + date.toString());
    final response = await http.post(
        Uri.parse("http://194.163.43.178:8000/AdminPayment/"),
        headers: <String, String>{
          //'Content-Type': 'application/json',
          'Accept-Encoding': 'application/gzip'
        },
        body: <String, String>{
          'paid_amount': paidamount,
          'farmer_name': farmername,
          'date': date,
          'remarks':remarks,
          'user': id.toString(),
        });

    var data = json.decode(response.body);
    if (data['status'] == 'success') {
      Get.back();
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: "faild");
    }
    print(response.body.toString());
  }
}
