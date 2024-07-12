import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePagePage extends StatelessWidget {
  const ChangePagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Change Password"),
          SizedBox(height: 30.h),
          PaddedScreen(
            child: Column(
              children: [
                customText(title: "Old Password"),
                CustomField(
                  hintText: "eg: 123456",
                  controller: TextEditingController(),
                  isPassword: true,
                ),
                SizedBox(height: 25.h),
                customText(title: "New Password"),
                CustomField(
                  hintText: "eg: 123456",
                  controller: TextEditingController(),
                  isPassword: true,
                ),
                SizedBox(height: 25.h),
                customText(title: "Confirm Password"),
                CustomField(
                  hintText: "eg: 123456",
                  controller: TextEditingController(),
                  isPassword: true,
                ),
                SizedBox(height: 100.h),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Update",
                ),
                SizedBox(height: 130.h),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextStyles.customText(
          title: title,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
