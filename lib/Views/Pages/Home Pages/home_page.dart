import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_advertise.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_agency.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_book.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_categories.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_categories_list.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_hotel_booking.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_level_and_point.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_match.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_online_course.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_options.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_pdf_resources.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_popular_cources.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_streaming_hub.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        padding: 10.w,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const HomeTop(),
            const HomeAdvertisement(),
            const HomeLevelAndPoint(),
            const HomeCategoriesList(),
            const HomeCategories(),
            const HomeStreamingHub(),
            const HomeOnlineCourse(),
            const HomeOptions(),
            const HomeHotelBooking(),
            const HomeMatch(),
            const HomePDFResources(),
            const HomeBook(),
            const HomePopularCources(),
            const HomeAgency(),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }
}
