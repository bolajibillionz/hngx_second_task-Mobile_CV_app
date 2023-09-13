import 'package:flutter/material.dart';
import 'package:hngx_second_project/constants/constants.dart';
import 'package:hngx_second_project/constants/custom_text.dart';
import 'package:hngx_second_project/constants/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.generalWhite,
        elevation: 0,
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
              buildCVDetails(title: 'Full Name:', subTitle: AppTexts.fullName),
              buildCVDetails(
                  title: 'Slack UserName:', subTitle: AppTexts.slackName),
              buildCVDetails(
                  title: 'GitHub Handle:', subTitle: AppTexts.gitHubHandle),
              buildCVDetails(title: 'LinkedIn:', subTitle: AppTexts.linkedIn),
              buildCVDetails(title: 'Email:', subTitle: AppTexts.email),
              buildCVDetails(
                  title: 'Phone Number:', subTitle: AppTexts.phoneNumber),
                  SizedBox(height: getProportionateScreenHeight(10),),
              buildCustomText(
                  inputText: 'Professional Summary',
                  fontSize: 20,
                  weight: FontWeight.bold,
                  colorName: AppColor.primaryColor),
              Expanded(
                child: buildCustomCenterText(
                    inputText: AppTexts.brief,
                    fontSize: 16,
                    weight: FontWeight.w700,
                    colorName: AppColor.primaryColor.withOpacity(0.5)),
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
