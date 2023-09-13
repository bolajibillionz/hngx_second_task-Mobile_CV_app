import 'package:flutter/material.dart';
import 'package:hngx_second_project/constants/constants.dart';
import 'package:hngx_second_project/constants/custom_text.dart';
import 'package:hngx_second_project/constants/size_config.dart';

class BuildCustomButton extends StatelessWidget {
  const BuildCustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
   
  });

  final void Function()? onPressed;
  final String buttonText;
 
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(48),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColor.primaryColor))),
        child: buildCustomText(
            inputText: buttonText,
            fontSize: 14,
            weight: FontWeight.bold,
            colorName: AppColor.generalWhite),
      ),
    );
  }
}
