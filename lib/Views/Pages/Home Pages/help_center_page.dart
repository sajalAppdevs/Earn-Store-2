import 'package:earn_store/Controllers/Home%20Controllers/help_center_controller.dart';
import 'package:earn_store/Utils/dummy_data.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Utils/url_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  bool isLoading = true;
  HelpCenterController controller = Get.put(HelpCenterController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getHelpCenter();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ScreenLoading()
        : RootDesign(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const CustomTop(title: "Help Centre"),
                PaddedScreen(
                  padding: 15.w,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      ListView.builder(
                        itemCount: DummyData.socialOptions.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return socialWidget(index: index);
                        },
                      ),
                      SizedBox(height: 120.h),
                      CustomButton(
                        onPressed: () async {
                          String shareLink = controller
                              .helpCenters.value!.helpCenter![0].shareLink
                              .toString();
                          await UrlHelpers.shareOnSocialMedia(
                            url: shareLink,
                          );
                        },
                        buttonText: "Share App",
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget socialWidget({required int index}) {
    HelpCenterController controller = Get.put(HelpCenterController());
    return Obx(
      () {
        String customerService = controller
            .helpCenters.value!.helpCenter![0].customerService
            .toString();
        String website =
            controller.helpCenters.value!.helpCenter![0].website.toString();
        String facebook =
            controller.helpCenters.value!.helpCenter![0].facebook.toString();
        String instagram =
            controller.helpCenters.value!.helpCenter![0].instagram.toString();
        String youtube =
            controller.helpCenters.value!.helpCenter![0].youtube.toString();
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 60.h,
            horizontalPadding: 20.w,
            onPressed: () async {
              if (index == 0) {
                await UrlHelpers.openUrl(customerService);
              } else if (index == 1) {
                await UrlHelpers.openUrl(website);
              } else if (index == 2) {
                await UrlHelpers.openUrl(facebook);
              } else if (index == 3) {
                await UrlHelpers.openUrl(instagram);
              } else if (index == 4) {
                await UrlHelpers.openUrl(youtube);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  DummyData.socialOptions[index].imagePath,
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 20.w),
                TextStyles.customText(
                  title: DummyData.socialOptions[index].name,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
