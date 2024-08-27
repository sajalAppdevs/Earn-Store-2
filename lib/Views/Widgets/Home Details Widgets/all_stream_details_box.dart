import 'package:earn_store/Controllers/Home%20Controllers/content_controller.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllStreamDetailsBox extends StatefulWidget {
  const AllStreamDetailsBox({super.key});

  @override
  State<AllStreamDetailsBox> createState() => _AllStreamDetailsBoxState();
}

class _AllStreamDetailsBoxState extends State<AllStreamDetailsBox> {
  ContentController controller = Get.put(ContentController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 1 / 1.1,
          ),
          itemCount: controller.contentDetails.value!.response!.length,
          itemBuilder: (BuildContext context, int index) {
            return streamBox(index: index);
          },
        );
      },
    );
  }

  Widget streamBox({required int index}) {
    return Obx(
      () {
        return GlassmorphismCard(
          boxHeight: 150.h,
          boxWidth: 110.w,
          onPressed: () async {
            await UrlHelpers.openUrl(
              controller.contentDetails.value!.response![index].link.toString(),
            );
          },
          child: NetworkImageWidget(
            imageUrl: controller.contentDetails.value!.response![index].image
                .toString(),
            height: 145.h,
            width: 95.w,
          ),
        );
      },
    );
  }
}
