import 'package:flutter/material.dart';
import 'package:hngx_second_project/constants/size_config.dart';

Text buildCustomText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(inputText,
      style: TextStyle(
          fontSize: getProportionateScreenWidth(fontSize),
          fontWeight: weight,
          color: colorName));
}

Text buildCustomCenterText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    textAlign: TextAlign.justify,
    style:TextStyle(
          fontSize: getProportionateScreenWidth(fontSize),
          fontWeight: weight,
          color: colorName));
}
