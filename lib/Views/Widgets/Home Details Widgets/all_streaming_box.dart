import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_stream_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllStreamingBox extends StatelessWidget {
  const AllStreamingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 0.5,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
      ),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return streamBox(index: index);
      },
    );
  }

  Widget streamBox({required int index}) {
    return GlassmorphismCard(
      onPressed: () {
        Get.to(
          const AllStreamDetails(),
        );
      },
      child: Image.asset(
        index % 2 == 0
            ? "${Paths.iconPath}hoichoi.png"
            : "${Paths.iconPath}chorki.png",
        height: 22.h,
        width: 72.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
