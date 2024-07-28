import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Widgets {
  static Widget CustomText({required String data,Color? color, FontWeight? fontWeight,double? fontSize,}){
    return Text(
      data,
style: TextStyle(
  color: color ?? Colors.white,
  fontWeight:  fontWeight ?? FontWeight.normal,
  fontSize: fontSize ?? 18,
),



    );
  }

static Widget spacer({double? height}){
    return  SizedBox(height: height ?? 15,);
}

}