import 'package:earn_store/Controllers/More%20Controllers/more_controller.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MorePageBody extends StatelessWidget {
  const MorePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DummyData.moreOptions.length,
      itemBuilder: (BuildContext context, int index) {
        return moreOption(index: index);
      },
    );
  }

  Widget moreOption({required int index}) {
    MoreController controller = Get.put(MoreController());
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        boxHeight: 50.h,
        onPressed: () {
          controller.moreNavigator(index: index);
        },
        horizontalPadding: 20.w,
        child: Row(
          children: [
            Image.asset(
              DummyData.moreOptions[index].imagePath,
              height: DummyData.moreOptions[index].height,
              width: DummyData.moreOptions[index].width,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 15.w),
            TextStyles.customText(
              title: DummyData.moreOptions[index].name,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
