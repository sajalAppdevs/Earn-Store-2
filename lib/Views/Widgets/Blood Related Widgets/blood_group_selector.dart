import 'dart:ui';

import 'package:earn_store/Controllers/Blood%20Controllers/blood_group_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BloodGroupSelector extends StatelessWidget {
  const BloodGroupSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BloodGroupController bloodGroupController = Get.put(BloodGroupController());
    return Obx(
      () {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 48.h,
              width: 155.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: GlassMorphismColors.glassColor1,
                boxShadow: [
                  BoxShadow(
                    color: GeneralColors.shadowColor1.withOpacity(0.26),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(1.18, 1.18),
                  ),
                  BoxShadow(
                    color: GeneralColors.blackColor.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(-1.18, -1.18),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: TextColors.textColor1,
                  padding: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                  ),
                  hint: Text(
                    bloodGroupController.bloodText.value,
                    style: TextStyles.fieldTextStyle(),
                  ),
                  onChanged: (value) {
                    bloodGroupController.setBloodGroup(value: value!.toInt());
                  },
                  items: List.generate(
                    bloodGroupController.bloodGroups.value!.bloodGroups!.length,
                    (index) => DropdownMenuItem(
                      value: bloodGroupController
                          .bloodGroups.value!.bloodGroups![index].id,
                      child: Text(
                        bloodGroupController
                            .bloodGroups.value!.bloodGroups![index].bloodGroup
                            .toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
