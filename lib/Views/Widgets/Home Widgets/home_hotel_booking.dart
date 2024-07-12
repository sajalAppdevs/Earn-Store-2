import 'package:earn_store/Statics/paths.dart';
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
    return Padding(
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
  }

  Widget hotels() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  const HotelDetailsPage(),
                );
              },
              child: Container(
                height: 128.h,
                width: 227.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage("${Paths.imagePath}hotel.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
