import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
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
        return CachedNetworkImage(
          imageUrl: controller.hotelDetails.value!.hotel!.image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 270.h,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
            child: const Column(
              children: [
                CustomTop(title: "Hotel Details"),
              ],
            ),
          ),
          placeholder: (context, url) => ButtonLoading(
            loadingColor: TextColors.textColor1,
            verticalPadding: 50.h,
          ),
          errorWidget: (context, url, error) => Container(
            height: 270.h,
            width: Get.width,
            color: Colors.grey,
            child: const Column(
              children: [
                CustomTop(title: "Hotel Details"),
              ],
            ),
          ),
        );
      },
    );
  }
}
