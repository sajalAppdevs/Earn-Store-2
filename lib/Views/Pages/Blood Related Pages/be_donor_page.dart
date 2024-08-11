import 'package:earn_store/Controllers/Blood%20Controllers/division_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/division_selector.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeDonorPage extends StatefulWidget {
  const BeDonorPage({super.key});

  @override
  State<BeDonorPage> createState() => _BeDonorPageState();
}

class _BeDonorPageState extends State<BeDonorPage> {
  DivisionController divisionController = Get.put(DivisionController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await divisionController.getDivision();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return divisionController.divisionLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(
                      title: "Donar",
                    ),
                    SizedBox(height: 30.h),
                    PaddedScreen(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(title: "Name"),
                          CustomField(
                            hintText: "eg: Soykot Hossain",
                            controller: TextEditingController(),
                          ),
                          SizedBox(height: 30.h),
                          customText(title: "Mobile Number"),
                          CustomField(
                            hintText: "eg: +880123456789",
                            controller: TextEditingController(),
                          ),
                          SizedBox(height: 30.h),
                          fieldRow(),
                          SizedBox(height: 30.h),
                          customText(title: "Choose Division"),
                          const DivisionSelector(),
                          SizedBox(height: 30.h),
                          customText(title: "Choose Zela"),
                          CustomField(
                            hintText: "Choose Zela",
                            controller: TextEditingController(),
                          ),
                          SizedBox(height: 30.h),
                          customText(title: "Choose Upozela"),
                          CustomField(
                            hintText: "Choose Upozela",
                            controller: TextEditingController(),
                          ),
                          SizedBox(height: 50.h),
                          CustomButton(
                            onPressed: () {},
                            buttonText: "Update",
                          ),
                          SizedBox(height: 70.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget fieldRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(title: "Blood Group"),
            CustomField(
              width: 155.w,
              hintText: "Choose",
              controller: TextEditingController(),
            ),
          ],
        ),
        Column(
          children: [
            customText(title: "Last Donate Date"),
            CustomField(
              width: 155.w,
              hintText: "dd/mm/yy",
              controller: TextEditingController(),
            ),
          ],
        ),
      ],
    );
  }

  Widget customText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextStyles.customText(
        title: title,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
