import 'package:flutter/material.dart';
// import 'package:irwin/reportpage.dart';

// import 'Admininputpage.dart';
// import 'Editentrypage.dart';
// import 'adminhome.dart';
// import 'adminquoteinput.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }

class Subdealer1 extends StatefulWidget {
  const Subdealer1({Key? key}) : super(key: key);

  @override
  State<Subdealer1> createState() => _Subdealer1State();
}

class _Subdealer1State extends State<Subdealer1> {
  @override
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
              //   MaterialPageRoute(builder: (context) => const Admininput()),
              // );
            },
            child: Text(
              "Sup dealer",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 118, 218, 4),
            child: Text(
              "SD",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          actions: [
            new IconButton(
                icon: new Image.asset('assets/call.png'),
                onPressed: () => ("")),
          ],
        ),
        body: Container(
            child: Center(
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(children: [
                          Row(children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                // width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      // Image(
                                      //     image:
                                      //         AssetImage("assets/fill.png")),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            Wrap(
                                              spacing: 170,
                                              children: [
                                                // Image(
                                                //     image: AssetImage(
                                                //         "assets/fill.png")
                                                //         ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(text: 'You Will get ',
                                                      style: TextStyle(
                                                      fontSize: 20,
                                                       color: Colors.red),),
                                                      TextSpan(
                                                        text: '/',
                                                        style: TextStyle(fontSize: 22,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      // TextSpan(text: ' world!'),
                                                    ],
                                                  ),
                                                ),

                                                Text(
                                                  '₹50',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(text: 'You Will give ',
                                                      style: TextStyle(
                                                      fontSize: 17,
                                                    color: Colors.green   ),),
                                                      TextSpan(
                                                        text: '(depends on Bal)',
                                                        style: TextStyle(fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      // TextSpan(text: ' world!'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              // margin: EdgeInsets.fromLTRB(
                              //   0,
                              //   0,
                              //   0,
                              //   0,
                              // ),
                              height: 60,
                              // width: 360,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Container(
                                child: Center(
                                  child: Row(
                                    // mainAxisSize: MainAxisSize.max,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                                      // hintText:
                                      //     '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',

                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Total ',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '₹ Entries',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 85,
                                      ),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'You Gave',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green),
                                          ),
                                          Text(
                                            '₹ 10',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 85,
                                      ),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'You Get',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                          ),
                                          Text(
                                            '₹ 50',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            height: 750 / 2,
                            child: ListView.builder(
                                itemCount: 10,
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
                                        // margin: new EdgeInsets.symmetric(horizontal: 0),
                                        // padding: EdgeInsets.symmetric(horizontal: 0),
                                        height: 60,
                                        // width: 349,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Container(
                                          child: Column(
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
                                                    child: Text(
                                                      "Je",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 9,
                                                  ),
                                                  Wrap(
                                                    spacing: 200,
                                                    children: [
                                                      Text(
                                                        'Jeeva',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      Text(
                                                        '₹ 40',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ]);
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 150,
                                    // padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
                                    child: ElevatedButton(
                                      // color: const Color.fromARGB(
                                      // 255, 2, 228, 119),
                                      child: const Text(
                                        'Paid',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const Subdealer()),
                                        // ); // print(nameController.text);
                                        // print(passwordController.text);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]))))));
  }
}
