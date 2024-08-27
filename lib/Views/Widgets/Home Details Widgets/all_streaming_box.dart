import 'package:earn_store/Controllers/Home%20Controllers/content_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_stream_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllStreamingBox extends StatelessWidget {
  const AllStreamingBox({super.key});

  @override
  Widget build(BuildContext context) {
    ContentController controller = Get.put(ContentController());
    return Obx(
      () {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 0.5,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.w,
          ),
          itemCount: controller.contents.value!.streamingHubs!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return streamBox(index: index);
          },
        );
      },
    );
  }

  Widget streamBox({required int index}) {
    ContentController controller = Get.put(ContentController());
    return Obx(
      () {
        return GlassmorphismCard(
          onPressed: () {
            Get.to(
              AllStreamDetails(
                mainLogo: controller.contents.value!.streamingHubs![index].image
                    .toString(),
                hubID: controller.contents.value!.streamingHubs![index].id
                    .toString(),
              ),
            );
          },
          child: NetworkImageWidget(
            imageUrl: controller.contents.value!.streamingHubs![index].image
                .toString(),
            height: 22.h,
            width: 72.w,
          ),
        );
      },
    );
  }
}
