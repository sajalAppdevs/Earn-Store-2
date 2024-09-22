import 'dart:ui';

import 'package:earn_store/Controllers/Blood%20Controllers/district_controller.dart';
import 'package:earn_store/Controllers/Blood%20Controllers/division_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DivisionSelector extends StatelessWidget {
  const DivisionSelector({super.key});

  @override
  Widget build(BuildContext context) {
    DivisionController divisionController = Get.put(DivisionController());
    DistrictController districtController = Get.put(DistrictController());
    return Obx(
      () {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 48.h,
              width: Get.width,
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
                    divisionController.divisionText.value,
                    style: TextStyles.fieldTextStyle(),
                  ),
                  onChanged: (value) {
                    divisionController.setDivision(value: value!.toInt());
                    districtController.getDistrict(
                      divisionID: value.toString(),
                    );
                  },
                  items: List.generate(
                    divisionController.divisions.value!.divisions!.length,
                    (index) => DropdownMenuItem(
                      value: divisionController
                          .divisions.value!.divisions![index].id,
                      child: Text(
                        divisionController
                            .divisions.value!.divisions![index].name
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
