import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
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
              controller.hotels.value!.hotels!.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: GestureDetector(
                  onTap: () {
                    String hotelID =
                        controller.hotels.value!.hotels![index].id.toString();
                    Get.to(
                      HotelDetailsPage(
                        hotelID: hotelID,
                      ),
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
        return NetworkImageWidget(
          imageUrl: controller.hotels.value!.hotels![index].image.toString(),
          height: 128.h,
          width: 227.w,
        );
      },
    );
  }
}
