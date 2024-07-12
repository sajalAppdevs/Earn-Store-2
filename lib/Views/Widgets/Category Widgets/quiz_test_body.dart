import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizTestBody extends StatelessWidget {
  const QuizTestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 10.w,
      child: GlassmorphismCard(
        boxHeight: 580.h,
        verticalPadding: 20.h,
        child: Column(
          children: [
            questionText(),
            SizedBox(height: 20.h),
            customDivider(),
            SizedBox(height: 20.h),
            Column(
              children: List.generate(
                4,
                (index) => questionBox(index: index),
              ),
            ),
            SizedBox(height: 50.h),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget questionText() {
    return PaddedScreen(
      child: TextStyles.customText(
        title: "What element does the chemical symbol Au stand for? ",
        isShowAll: true,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget customDivider() {
    return Divider(
      color: TextColors.textColor1,
      height: 0.5.h,
      thickness: 0.5,
    );
  }

  Widget questionBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 55.h,
        horizontalPadding: 20.w,
        child: Row(
          children: [
            TextStyles.customText(title: "A.   Titanium"),
          ],
        ),
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: CustomButton(
        onPressed: () {},
        buttonText: "Submit",
      ),
    );
  }
}
