import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/hotel_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllHotelBox extends StatelessWidget {
  const AllHotelBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return hotelBox(index: index);
      },
    );
  }

  Widget hotelBox({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 175.h,
        boxRightPadding: 15.w,
        onPressed: () {
          Get.to(
            const HotelDetailsPage(),
          );
        },
        childAlignment: Alignment.centerLeft,
        boxLeftPadding: 20.w,
        child: Image.asset(
          "${Paths.imagePath}hotel.jpg",
          height: 150.h,
          width: 300.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
