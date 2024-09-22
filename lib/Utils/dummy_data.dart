import 'package:earn_store/Statics/paths.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DummyData {
  static List<Methods> moreOptions = [
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}my_profile.png",
      name: "My Profile",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}leaderboard.png",
      name: "Leader Board",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}referlist.png",
      name: "Refer List",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}spin.png",
      name: "Spin",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}total_earning.png",
      name: "Total Earning",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}level.png",
      name: "Level",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}packages.png",
      name: "Packages",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}run_ads.png",
      name: "Run Ads",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}change_pass.png",
      name: "Change Password",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}live_chat.png",
      name: "Live Chat with Us",
    ),
    Methods(
      height: 26.h,
      width: 26.w,
      imagePath: "${Paths.iconPath}logout.png",
      name: "Logout",
    ),
  ];
  static List<Methods> socialOptions = [
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}customer_care.png",
      name: "Customer Service",
    ),
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}website.png",
      name: "Website",
    ),
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}facebook.png",
      name: "Facebook",
    ),
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}instagram.png",
      name: "Instagram",
    ),
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}youtube.png",
      name: "Youtube",
    ),
  ];
  static List<Methods> withdrawMethods = [
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}bkash.png",
      name: "Bkash",
    ),
    Methods(
      height: 29.h,
      width: 60.w,
      imagePath: "${Paths.iconPath}nagad.png",
      name: "Nagad",
    ),
  ];
  static List<Methods> homeCategories2 = [
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}doinik_bazar.png",
      name: "Doinik Bazar",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}news_paper.png",
      name: "Newspaper",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}live_tv.png",
      name: "Live TV",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}blood_bank.png",
      name: "Blood Bank",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}food_delivery.png",
      name: "Food Delivery",
    ),
    Methods(
      height: 30.h,
      width: 35.w,
      imagePath: "${Paths.iconPath}ride_share.png",
      name: "Ride Share",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}parcel_delivery.png",
      name: "Parcel Delivery",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}quiz_test.png",
      name: "Quiz Test",
    ),
    Methods(
      height: 24.h,
      width: 24.w,
      imagePath: "${Paths.iconPath}tour_package.png",
      name: "Tour Package",
    ),
  ];

  static List<String> homeCategories = [
    "All",
    "E-commerce",
  ];

  static List<Methods> homeOptions = [
    Methods(
      height: 42.h,
      width: 42.w,
      imagePath: "${Paths.iconPath}video.png",
      name: "Watch Video",
    ),
    Methods(
      height: 42.h,
      width: 42.w,
      imagePath: "${Paths.iconPath}youtube.png",
      name: "Youtube Video",
    ),
    // Methods(
    //   height: 40.h,
    //   width: 50.w,
    //   imagePath: "${Paths.iconPath}ads_income.png",
    //   name: "Ads Income",
    // ),
    // Methods(
    //   height: 42.h,
    //   width: 42.w,
    //   imagePath: "${Paths.iconPath}play_store.png",
    //   name: "App Download",
    // ),
  ];
  static List<Methods> paymentMethods = [
    Methods(
      height: 30.h,
      width: 30.w,
      imagePath: "${Paths.iconPath}bkash.png",
      name: "Bkash",
    ),
    Methods(
      height: 30.h,
      width: 60.w,
      imagePath: "${Paths.iconPath}nagad.png",
      name: "Nagad",
    ),
  ];
}

class Methods {
  double height;
  double width;
  String imagePath;
  String name;
  Methods({
    required this.height,
    required this.width,
    required this.imagePath,
    required this.name,
  });
}
