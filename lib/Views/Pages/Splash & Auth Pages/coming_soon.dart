import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextStyles.customText(
            title: "Coming Soon...",
          ),
          SizedBox(height: 50.h),
          CustomButton(
            isCenter: true,
            onPressed: () {
              Navigator.pop(context);
            },
            buttonText: "Back",
          )
        ],
      ),
    );
  }
}
