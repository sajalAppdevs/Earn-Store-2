import 'package:earn_store/Controllers/Blood%20Controllers/donor_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonorSearchSecond extends StatefulWidget {
  final String bloodGroup;
  final String bloodGroupID;
  const DonorSearchSecond(
      {super.key, required this.bloodGroup, required this.bloodGroupID});

  @override
  State<DonorSearchSecond> createState() => _DonorSearchSecondState();
}

class _DonorSearchSecondState extends State<DonorSearchSecond> {
  TextEditingController searchController = TextEditingController();
  DonorController controller = Get.put(DonorController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getSpecificDonor(bloodGroupID: widget.bloodGroupID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isDonorLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    CustomTop(title: "${widget.bloodGroup} Donar list"),
                    PaddedScreen(
                      child: CustomField(
                        hintText: "Search",
                        controller: searchController,
                        suffixIcon: Icons.search,
                        onPressed: (value) {
                          controller.filterDonor(value: searchController.text);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ListView.builder(
                      itemCount: controller.donors.value!.donors!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return donorBox(index: index);
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
      },
    );
  }

  Widget donorBox({required int index}) {
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: Row(
            children: [
              userImage(),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.customText(
                    title:
                        controller.donors.value!.donors![index].name.toString(),
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 3.h),
                  TextStyles.customText(
                    title: controller.donors.value!.donors![index].mobileNumber
                        .toString(),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget userImage() {
    return Container(
      height: 70.h,
      width: 70.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}blank_image.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
