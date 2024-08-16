import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:earn_store/Controllers/Home%20Controllers/general_info_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/chat_page.dart';
import 'package:earn_store/Views/Pages/Earning%20Pages/earning_page.dart';
import 'package:earn_store/Views/Pages/Feed%20Pages/feed_page.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/home_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/more_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool isLoading = true;
  UserProfileController userProfileController =
      Get.put(UserProfileController());
  GeneralInfoController generalInfoController =
      Get.put(GeneralInfoController());
  int index = 0;

  List<Widget> pages = [
    const HomePage(),
    const EarningPage(),
    const ChatPage(),
    const FeedPage(),
    const MorePage(),
  ];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await userProfileController.getUserProfile();
    await generalInfoController.getGeneralInfo();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const ScreenLoading()
          : Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                index: index,
                color: TextColors.textColor1.withOpacity(0.3),
                items: [
                  CurvedNavigationBarItem(
                    child: Image.asset(
                      "${Paths.iconPath}home.png",
                      height: 27.h,
                      width: 24.w,
                      fit: BoxFit.fill,
                    ),
                    label: "Home",
                    labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: TextColors.textColor1,
                    ),
                  ),
                  CurvedNavigationBarItem(
                    child: Image.asset(
                      "${Paths.iconPath}earning.png",
                      height: 26.h,
                      width: 27.w,
                      fit: BoxFit.fill,
                    ),
                    label: "Earning",
                    labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: TextColors.textColor1,
                    ),
                  ),
                  CurvedNavigationBarItem(
                    child: Image.asset(
                      "${Paths.iconPath}chat.png",
                      height: 27.5.h,
                      width: 29.w,
                      fit: BoxFit.fill,
                    ),
                    label: "Chat",
                    labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: TextColors.textColor1,
                    ),
                  ),
                  CurvedNavigationBarItem(
                    child: Image.asset(
                      "${Paths.iconPath}feed.png",
                      height: 26.h,
                      width: 24.w,
                      fit: BoxFit.fill,
                    ),
                    label: "Feed",
                    labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: TextColors.textColor1,
                    ),
                  ),
                  CurvedNavigationBarItem(
                    child: Image.asset(
                      "${Paths.iconPath}more.png",
                      height: 25.h,
                      width: 30.w,
                      fit: BoxFit.fill,
                    ),
                    label: "More",
                    labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: TextColors.textColor1,
                    ),
                  ),
                ],
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
              ),
              body: pages[index],
            ),
    );
  }
}
