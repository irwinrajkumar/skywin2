import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:tanmiah/widgets/text.dart';
import 'package:sizer/sizer.dart';

import 'text.dart';

class OrangeTile extends StatelessWidget {
  final String text;
  const OrangeTile({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.primaryColorLight,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 10),
        child: Txt(
          text: text,
          color: Colors.white,
          weight: FontWeight.bold,
          fsize: 17,
        ),
      ),
    );
  }
}