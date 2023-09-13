import 'package:flutter/material.dart';
import 'package:hngx_second_project/constants/constants.dart';
import 'package:hngx_second_project/constants/custom_button.dart';
import 'package:hngx_second_project/constants/custom_text.dart';
import 'package:hngx_second_project/constants/size_config.dart';
import 'package:hngx_second_project/screens/edit_cv_page.dart';

class HomePage extends StatelessWidget {
  final String fullName;
  final String slackName;
  final String gitHubHandle;
  final String email;
  final String phoneNumber;
  final String summary;
  const HomePage({super.key,
    required this.fullName,
      required this.slackName,
      required this.gitHubHandle,
      required this.email,
      required this.phoneNumber,
      required this.summary
   });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.generalWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: buildCustomText(
            inputText: AppTexts.title,
            fontSize: 24,
            weight: FontWeight.bold,
            colorName: AppColor.primaryColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCVDetails(title: 'Full Name:', subTitle: fullName),
              buildCVDetails(
                  title: 'Slack UserName:', subTitle: slackName),
              buildCVDetails(
                  title: 'GitHub Handle:', subTitle: gitHubHandle),
              buildCVDetails(title: 'Email:', subTitle: email),
              buildCVDetails(
                  title: 'Phone Number:', subTitle: phoneNumber),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildCustomText(
                  inputText: 'Professional Summary',
                  fontSize: 20,
                  weight: FontWeight.bold,
                  colorName: AppColor.primaryColor),
              Expanded(
                child: buildCustomCenterText(
                    inputText: summary,
                    fontSize: 16,
                    weight: FontWeight.w700,
                    colorName: AppColor.primaryColor.withOpacity(0.5)),
              ),
              BuildCustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditCVScreen(
                                fullName: fullName,
                                slackName: slackName,
                                gitHubHandle: gitHubHandle,
                                summary: summary,
                                email: email,
                                phoneNumber: phoneNumber,
                              )));
                },
                buttonText: 'Edit CV',
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildCVDetails({required String title, required String subTitle}) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(15),
          horizontal: getProportionateScreenHeight(7)),
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(15)),
      decoration: BoxDecoration(
          color: AppColor.greyColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCustomText(
              inputText: title,
              fontSize: 16,
              weight: FontWeight.bold,
              colorName: AppColor.primaryColor),
          buildCustomText(
              inputText: subTitle,
              fontSize: subTitle.length > 25 ? 12 : 16,
              weight: FontWeight.bold,
              colorName: AppColor.greyColor)
        ],
      ),
    );
  }
}
