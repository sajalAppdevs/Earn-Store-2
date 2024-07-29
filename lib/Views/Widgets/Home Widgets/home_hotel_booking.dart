import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_hotel_page.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/hotel_details_page.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeHotelBooking extends StatelessWidget {
  const HomeHotelBooking({super.key});

  @override
  Widget build(BuildContext context) {
    AllHotelController controller = Get.put(AllHotelController());
    return Obx(
      () {
        return controller.hotelLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Padding(
                padding: EdgeInsets.only(
                  top: 5.h,
                  bottom: 25.h,
                ),
                child: Column(
                  children: [
                    TitleText(
                      title: "Hotel Booking",
                      onPressed: () {
                        Get.to(
                          const AllHotelPage(),
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    hotels(),
                  ],
                ),
              );
      },
    );
  }

  Widget hotels() {
    AllHotelController controller = Get.put(AllHotelController());
    return Obx(
      () {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              controller.hotels.value!.hotel!.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      const HotelDetailsPage(),
                    );
                  },
                  child: hotelImage(index: index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget hotelImage({required int index}) {
    AllHotelController controller = Get.put(AllHotelController());
    return Obx(
      () {
        return CachedNetworkImage(
          imageUrl: controller.hotels.value!.hotel![index].image.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 128.h,
            width: 227.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => const ButtonLoading(
            loadingColor: TextColors.textColor1,
          ),
          errorWidget: (context, url, error) => Container(
            height: 128.h,
            width: 227.w,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
