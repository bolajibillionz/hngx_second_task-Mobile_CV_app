import 'package:flutter/material.dart';
import 'package:hngx_second_project/constants/constants.dart';
import 'package:hngx_second_project/constants/custom_button.dart';
import 'package:hngx_second_project/constants/custom_text.dart';
import 'package:hngx_second_project/constants/size_config.dart';
import 'package:hngx_second_project/screens/home_page.dart';

class EditCVScreen extends StatefulWidget {
  final String fullName;
  final String slackName;
  final String gitHubHandle;
  final String email;
  final String phoneNumber;
  final String summary;

  const EditCVScreen(
      {super.key,
      required this.fullName,
      required this.slackName,
      required this.gitHubHandle,
      required this.email,
      required this.phoneNumber,
      required this.summary});

  @override
  State<EditCVScreen> createState() => _EditCVScreenState();
}

class _EditCVScreenState extends State<EditCVScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _slackNameController = TextEditingController();
  final TextEditingController _gitHubHandleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();

  @override
  void initState() {
    _fullNameController.text = widget.fullName;
    _slackNameController.text = widget.slackName;
    _gitHubHandleController.text = widget.gitHubHandle;
    _emailController.text = widget.email;
    _phoneNumberController.text = widget.phoneNumber;
    _summaryController.text = widget.summary;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _gitHubHandleController.dispose();
    _emailController.dispose();
    _slackNameController.dispose();
    _summaryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.generalWhite,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: buildCustomText(
            inputText: 'Edit CV',
            fontSize: 24,
            weight: FontWeight.bold,
            colorName: AppColor.primaryColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildEditField(
                  title: 'Full Name',
                  keyboard: TextInputType.text,
                  textController: _fullNameController,
                  fieldHeight: 50),
              buildEditField(
                  title: 'Slack Name',
                  keyboard: TextInputType.text,
                  textController: _slackNameController,
                  fieldHeight: 50),
              buildEditField(
                  title: 'GitHub Handle',
                  keyboard: TextInputType.text,
                  textController: _gitHubHandleController,
                  fieldHeight: 50),
              buildEditField(
                  title: 'Email',
                  keyboard: TextInputType.emailAddress,
                  textController: _emailController,
                  fieldHeight: 50),
              buildEditField(
                  title: 'Phone Number',
                  keyboard: TextInputType.number,
                  textController: _phoneNumberController,
                  fieldHeight: 50),
              buildEditField(
                  title: ' Professional Summary',
                  keyboard: TextInputType.multiline,
                  textController: _summaryController,
                  fieldHeight: 200),
              BuildCustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                fullName: _fullNameController.text,
                                gitHubHandle: _gitHubHandleController.text,
                                summary: _summaryController.text,
                                email: _emailController.text,
                                phoneNumber: _phoneNumberController.text,
                                slackName: _slackNameController.text,
                              )));
                },
                buttonText: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildEditField(
      {required TextInputType keyboard,
      required String title,
      required TextEditingController textController,
      required double fieldHeight}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomText(
            inputText: title,
            fontSize: 16,
            weight: FontWeight.bold,
            colorName: AppColor.primaryColor),
        Container(
          width: getProportionateScreenWidth(370),
          height: getProportionateScreenHeight(fieldHeight),
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(4)),
          margin: EdgeInsets.only(
              top: getProportionateScreenHeight(5),
              bottom: getProportionateScreenHeight(15)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.primaryColor)),
          child: TextFormField(
            controller: textController,
            expands: true,
            minLines: null,
            maxLines: null,
            keyboardType: keyboard,
            autocorrect: false,
            cursorColor: AppColor.primaryColor,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              fillColor: AppColor.generalWhite,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
      ],
    );
  }
}
