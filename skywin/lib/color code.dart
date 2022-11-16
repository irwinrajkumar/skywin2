import 'package:flutter/material.dart';

const greenn = Color(0xff00803f);
const bluee = Color(0xff1E1776);
const reded = Color(0xffEE1C25);
const brownn = Color(0xff707070);
const whitttt = Color(0xffFFD403);
const bluegradi = Color(0xff6C63FF);
const blackey = Color(0xff000000);
const whitegrey = Color(0xffF8F8F8);
const white = Color(0xffFFFFFF);
double height_ = 0;
double width_ = 0;
var size;
  mediaSize(BuildContext context) {
    size = MediaQuery.of(context).size;
    height_ = size.height;
    width_ = size.width;
  }

class GradientValue {
  deconrationBIxx() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color(0xfffcf8f8),
        Color(0xff0B15C4),
      ],
    ));
  }


}