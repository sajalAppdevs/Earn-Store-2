import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HotelDetailsTop extends StatelessWidget {
  const HotelDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    AllHotelController controller = Get.put(
      AllHotelController(),
    );
    return Obx(
      () {
        String imagePath =
            controller.hotelDetails.value!.hotel!.image.toString();
        return imagePath.isEmpty
            ? Container(
                height: 270.h,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: const Column(
                  children: [
                    CustomTop(title: "Hotel Details"),
                  ],
                ),
              )
            : Container(
                height: 270.h,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Column(
                  children: [
                    CustomTop(title: "Hotel Details"),
                  ],
                ),
              );
      },
    );
  }
}
