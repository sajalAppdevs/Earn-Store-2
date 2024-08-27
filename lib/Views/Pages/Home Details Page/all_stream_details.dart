// ignore: unused_import
import 'package:earn_store/Controllers/Home%20Controllers/content_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_stream_details_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllStreamDetails extends StatefulWidget {
  final String mainLogo;
  final String hubID;
  const AllStreamDetails({
    super.key,
    required this.mainLogo,
    required this.hubID,
  });

  @override
  State<AllStreamDetails> createState() => _AllStreamDetailsState();
}

class _AllStreamDetailsState extends State<AllStreamDetails> {
  ContentController controller = Get.put(ContentController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getContentDetails(hubID: widget.hubID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.contentDetailsLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Pelf Earn"),
                    SizedBox(height: 10.h),
                    PaddedScreen(
                      padding: 10.w,
                      child: Column(
                        children: [
                          streamLogo(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const AllStreamDetailsBox(),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
      },
    );
  }

  Widget streamLogo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: NetworkImageWidget(
        imageUrl: widget.mainLogo,
        height: 24.h,
        width: 80.w,
      ),
    );
  }
}
