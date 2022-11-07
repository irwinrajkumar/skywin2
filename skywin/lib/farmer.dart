import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// import 'package:example/pages/custom_data_table.dart';
// import 'package:example/pages/local_table.dart';
// import 'pages/custom_column_nested_table.dart';
// import 'pages/custom_column_table.dart';
// import 'pages/simple_table.dart';

// import 'mainpage.dart';
// import 'myaccountpage.dart';

double answer =0;
List<bool> _rowList = [];
List<dynamic> _rowList1 = [];

// var rng = new Random();
// var code = rng.nextInt(900000) + 100000;
class framer extends StatefulWidget {
  const framer({Key? key}) : super(key: key);

  @override
  State<framer> createState() => _framerState();
}

class _framerState extends State<framer> {
  
TextEditingController snonumber = TextEditingController();
TextEditingController addnumber = TextEditingController();
TextEditingController addsnumber = TextEditingController();
  
 

   List<DataRow> _rowList = [
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('01')),
    //   DataCell(Text
    //   ('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('02')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('03')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('04')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('05')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('06')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('07')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('08')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('09')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('10')),
    //   DataCell(Text('50kg')),
    //   DataCell(Text('100kg')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(
    //     Text('totalweight'),
    //   ),
    //   DataCell(Text('')),
    //   DataCell(Text('')),
    // ]),
    // DataRow(cells: <DataCell>[
    //   DataCell(Text('Bag weight')),
    //   DataCell(Text('')),
    //   DataCell(Text('')),
    // ]),
  ];

  void _addRow() {
    // Built in Flutter Method.
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below.
      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(TextField(controller:snonumber,)),
        DataCell(TextField(controller:addnumber,)),
        DataCell(TextField(controller:addsnumber,)),
      ]));
    });
  }


 void initState() {
   _rowList1.add({
"key":50,
 });
    _rowList1.add({
"key":100,
 });
 double vv = 0.0;
    // admindata();
for (int i = 0; i < _rowList1.length; i++) {
  vv+=_rowList1[i]["key"];
      }
      print(vv);
    super.initState();
  }
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
                  
                    Text(
                      'Farmername',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    
                  
                  // TextField(
                  //   decoration:
                  //       new InputDecoration.collapsed(hintText: 'Username'),
                  // ),
                ]),
          ),
          backgroundColor: Color.fromARGB(255, 0, 123, 255),
          // elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        DataTable(columns: [
          DataColumn(label: Text('No.of.bags')),
          DataColumn(label: Text('bag weight')),
          DataColumn(label: Text('Gross weight')),
        ], rows: _rowList),
      ])),
      floatingActionButton: SpeedDial(
          icon: Icons.navigation,
          backgroundColor: Colors.green,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.face),
              
              label: 'Add Row',
              backgroundColor: Colors.amberAccent,
              onTap: _addRow,
            ),
            SpeedDialChild(
              child: const Icon(Icons.email),
              label: 'Add Value',
              backgroundColor: Colors.amberAccent,
              // onTap: () {answer+=double.parse(addnumber.text); print(addnumber.text);},
            ),
           
            SpeedDialChild(
              child: const Icon(Icons.chat),
              // label: 'Message',
              backgroundColor: Colors.amberAccent,
              onTap: () {/* Do something */},
            ),
          ],),
          
    ),);
  }
  
}

