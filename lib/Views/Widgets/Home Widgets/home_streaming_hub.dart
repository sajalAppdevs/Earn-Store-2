import 'package:earn_store/Controllers/Home%20Controllers/content_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_stream_details.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_streaming_page.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeStreamingHub extends StatelessWidget {
  const HomeStreamingHub({super.key});

  @override
  Widget build(BuildContext context) {
    ContentController controller = Get.put(ContentController());
    return Obx(
      () {
        return controller.contentLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Column(
                children: [
                  TitleText(
                    title: "Streaming Hub",
                    onPressed: () {
                      Get.to(
                        const AllStreamingPage(),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  contents(),
                ],
              );
      },
    );
  }

  Widget contents() {
    ContentController controller = Get.put(ContentController());
    return Obx(
      () {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(
              controller.contents.value!.streamingHubs!.length > 5
                  ? 5
                  : controller.contents.value!.streamingHubs!.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: GlassmorphismCard(
                  boxHeight: 60.h,
                  boxWidth: 120.w,
                  onPressed: () {
                    Get.to(
                      AllStreamDetails(
                        mainLogo: controller
                            .contents.value!.streamingHubs![index].image
                            .toString(),
                        hubID: controller
                            .contents.value!.streamingHubs![index].id
                            .toString(),
                      ),
                    );
                  },
                  child: NetworkImageWidget(
                    imageUrl: controller
                        .contents.value!.streamingHubs![index].image
                        .toString(),
                    height: 22.h,
                    width: 73.w,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
