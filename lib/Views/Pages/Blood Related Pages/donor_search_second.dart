import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonorSearchSecond extends StatelessWidget {
  final String bloodGroup;
  const DonorSearchSecond({super.key, required this.bloodGroup});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CustomTop(title: "$bloodGroup Donar list"),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            itemCount: 10,
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
  }

  Widget donorBox({required int index}) {
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
            children: [
              TextStyles.customText(
                title: "Rashidatul Kobra",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 3.h),
              TextStyles.customText(
                title: "+8801753227645",
                fontWeight: FontWeight.w500,
              ),
            ],
          )
        ],
      ),
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
