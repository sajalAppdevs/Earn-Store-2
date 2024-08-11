import 'package:earn_store/Controllers/Blood%20Controllers/blood_group_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Blood%20Related%20Pages/donor_search_second.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonorSearchFirst extends StatefulWidget {
  const DonorSearchFirst({super.key});

  @override
  State<DonorSearchFirst> createState() => _DonorSearchFirstState();
}

class _DonorSearchFirstState extends State<DonorSearchFirst> {
  BloodGroupController controller = Get.put(BloodGroupController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getAllBloodGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isBloodLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Blood Group"),
                    Column(
                      children: List.generate(
                        controller.bloodGroups.value!.bloodGroups!.length,
                        (index) => bloodGroupBox(
                          index: index,
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget bloodGroupBox({required int index}) {
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 55.h,
            horizontalPadding: 20.w,
            onPressed: () {
              Get.to(
                DonorSearchSecond(
                  bloodGroup: controller
                      .bloodGroups.value!.bloodGroups![index].bloodGroup
                      .toString(),
                  bloodGroupID: controller
                      .bloodGroups.value!.bloodGroups![index].id
                      .toString(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextStyles.customText(
                  title: controller
                      .bloodGroups.value!.bloodGroups![index].bloodGroup
                      .toString(),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                  color: TextColors.textColor1,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
