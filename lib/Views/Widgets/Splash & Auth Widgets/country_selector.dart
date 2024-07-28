import 'dart:ui';

import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/country_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector({super.key});

  @override
  Widget build(BuildContext context) {
    CountryController countyController = Get.put(CountryController());
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
                    countyController.countryText.value,
                    style: TextStyles.fieldTextStyle(),
                  ),
                  onChanged: (value) {
                    countyController.setCountry(value: value!.toInt());
                  },
                  items: List.generate(
                    countyController.counties.value!.countrys!.length,
                    (index) => DropdownMenuItem(
                      value:
                          countyController.counties.value!.countrys![index].id,
                      child: Text(
                        countyController.counties.value!.countrys![index].name
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
