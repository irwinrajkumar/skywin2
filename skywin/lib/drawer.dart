import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irwin/adduser.dart';
import 'package:irwin/color%20code.dart';
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

var firstname;
var lastname;
var userid;

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                MaterialPageRoute(builder: (context) => const subdealerlist()),
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
        ],
      ),
      //   backgroundColor: Color.fromARGB(255, 238, 237, 237),
      //   // drawer: NavBar(),
    );
  }
}
