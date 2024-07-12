import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStreamDetailsBox extends StatelessWidget {
  const AllStreamDetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1 / 1.1,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return streamBox(index: index);
      },
    );
  }

  Widget streamBox({required int index}) {
    return GlassmorphismCard(
      boxHeight: 150.h,
      boxWidth: 110.w,
      child: Image.asset(
        "${Paths.iconPath}tintin.png",
        height: 145.h,
        width: 95.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
