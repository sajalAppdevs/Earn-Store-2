import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/hotel_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllHotelBox extends StatelessWidget {
  const AllHotelBox({super.key});

  @override
  Widget build(BuildContext context) {
    AllHotelController controller = Get.put(
      AllHotelController(),
    );
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.hotels.value!.hotels!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return hotelBox(index: index);
          },
        );
      },
    );
  }

  Widget hotelBox({required int index}) {
    AllHotelController controller = Get.put(
      AllHotelController(),
    );
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 175.h,
            boxRightPadding: 15.w,
            onPressed: () {
              String hotelID =
                  controller.hotels.value!.hotels![index].id.toString();
              Get.to(
                HotelDetailsPage(
                  hotelID: hotelID,
                ),
              );
            },
            childAlignment: Alignment.centerLeft,
            boxLeftPadding: 20.w,
            child: NetworkImageWidget(
              imageUrl: controller.hotels.value!.hotels![index].image.toString(),
              height: 150.h,
              width: 300.w,
            ),
          ),
        );
      },
    );
  }
}
