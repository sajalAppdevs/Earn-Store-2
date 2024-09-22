import 'package:earn_store/Controllers/Blood%20Controllers/add_donor_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/blood_group_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/district_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/division_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/upazila_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/blood_group_selector.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/district_selector.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/division_selector.dart.dart';
import 'package:earn_store/Views/Widgets/Blood%20Related%20Widgets/upazila_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeDonorPage extends StatefulWidget {
  const BeDonorPage({super.key});

  @override
  State<BeDonorPage> createState() => _BeDonorPageState();
}

class _BeDonorPageState extends State<BeDonorPage> {
  AddDonorController addDonorController = Get.put(
    AddDonorController(),
  );
  BloodGroupController bloodGroupController = Get.put(
    BloodGroupController(),
  );
  DivisionController divisionController = Get.put(
    DivisionController(),
  );
  DistrictController districtController = Get.put(
    DistrictController(),
  );
  UpazilaController upazilaController = Get.put(
    UpazilaController(),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await divisionController.getDivision();
    await bloodGroupController.getAllBloodGroup();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController lastDonateDate = TextEditingController();
    return Obx(
      () {
        return divisionController.divisionLoading.value ||
                bloodGroupController.isBloodLoading.value
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
                            controller: nameController,
                          ),
                          SizedBox(height: 30.h),
                          customText(title: "Mobile Number"),
                          CustomField(
                            hintText: "eg: +880123456789",
                            controller: mobileController,
                          ),
                          SizedBox(height: 30.h),
                          fieldRow(lastDonateController: lastDonateDate),
                          SizedBox(height: 30.h),
                          customText(title: "Choose Division"),
                          const DivisionSelector(),
                          SizedBox(height: 30.h),
                          customText(title: "Choose Zela"),
                          divisionController.divisionID.value == 0
                              ? CustomField(
                                  hintText: "Choose Zela",
                                  controller: TextEditingController(),
                                )
                              : districtController.districtLoading.value
                                  ? ButtonLoading(
                                      verticalPadding: 30.h,
                                    )
                                  : const DistrictSelector(),
                          SizedBox(height: 30.h),
                          customText(title: "Choose Upozela"),
                          districtController.districtID.value == 0
                              ? CustomField(
                                  hintText: "Choose Upozela",
                                  controller: TextEditingController(),
                                )
                              : upazilaController.upazilaLoading.value
                                  ? const ButtonLoading()
                                  : const UpazilaSelector(),
                          SizedBox(height: 50.h),
                          addDonorController.addDonorLoading.value
                              ? const ButtonLoading()
                              : CustomButton(
                                  onPressed: () {
                                    addDonorController.addDonor(
                                      name: nameController.text,
                                      mobile: mobileController.text,
                                      lastDonorDate: lastDonateDate.text,
                                    );
                                  },
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

  Widget fieldRow({required TextEditingController lastDonateController}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(title: "Blood Group"),
            const BloodGroupSelector(),
          ],
        ),
        Column(
          children: [
            customText(title: "Last Donate Date"),
            CustomField(
              width: 155.w,
              hintText: "dd/mm/yy",
              controller: lastDonateController,
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
