import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Help Centre"),
          PaddedScreen(
            padding: 15.w,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                ListView.builder(
                  itemCount: DummyData.socialOptions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return socialWidget(index: index);
                  },
                ),
                SizedBox(height: 120.h),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Share App",
                ),
                SizedBox(height: 50.h),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget socialWidget({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 60.h,
        horizontalPadding: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              DummyData.socialOptions[index].imagePath,
              height: 30.h,
              width: 30.w,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 20.w),
            TextStyles.customText(
              title: DummyData.socialOptions[index].name,
            )
          ],
        ),
      ),
    );
  }
}
