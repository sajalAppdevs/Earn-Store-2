import 'package:earn_store/Controllers/User%20Controllers/refer_list_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/More%20Pages%20Widgets/refer_list_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReferListPage extends StatefulWidget {
  const ReferListPage({super.key});

  @override
  State<ReferListPage> createState() => _ReferListPageState();
}

class _ReferListPageState extends State<ReferListPage> {
  ReferListController controller = Get.put(ReferListController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getReferList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.referLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Referlist"),
                    PaddedScreen(
                      padding: 15.w,
                      child: Column(
                        children: [
                          referListTopTitles(),
                          SizedBox(height: 20.h),
                          const ReferListBody()
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget referListTopTitles() {
    return PaddedScreen(
      padding: 5.w,
      child: Row(
        children: [
          customText(title: "Serial"),
          SizedBox(width: 15.w),
          customText(title: "Name"),
          SizedBox(width: 100.w),
          customText(title: "Refer"),
          SizedBox(width: 20.w),
          customText(title: "Point"),
        ],
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontWeight: FontWeight.w500,
    );
  }
}
