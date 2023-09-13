import 'package:flutter/material.dart';
import 'package:hngx_second_project/constants/constants.dart';
import 'package:hngx_second_project/constants/custom_text.dart';
import 'package:hngx_second_project/constants/size_config.dart';
import 'package:hngx_second_project/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  void navigate() {
    if (mounted) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    fullName: AppTexts.fullName,
                    slackName: AppTexts.slackName,
                    gitHubHandle: AppTexts.gitHubHandle,
                    phoneNumber: AppTexts.phoneNumber,
                    email: AppTexts.email,
                    summary: AppTexts.brief,
                  )),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: buildCustomCenterText(
            inputText: AppTexts.welcome,
            fontSize: 36,
            weight: FontWeight.bold,
            colorName: AppColor.primaryColor),
      ),
    );
  }
}
