import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCourseDetailsBox extends StatelessWidget {
  const AllCourseDetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1 / 0.6,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return courseBox(index: index);
      },
    );
  }

  Widget courseBox({required int index}) {
    return GlassmorphismCard(
      boxHeight: 110.h,
      boxWidth: 165.w,
      child: Image.asset(
        "${Paths.iconPath}quran_learning.png",
        height: 90.h,
        width: 145.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
