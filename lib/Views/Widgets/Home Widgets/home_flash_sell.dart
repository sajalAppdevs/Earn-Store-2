import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/title_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFlashSell extends StatelessWidget {
  const HomeFlashSell({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: [
        const TitleText2(
          title: "Flash Sale",
          hideAll: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) => imageBox(index: index),
            ),
          ),
        )
      ],
    );
  }

  Widget imageBox({required int index}) {
    return Container(
      height: 105.h,
      width: 180.w,
      margin: EdgeInsets.only(
        right: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        image: const DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}flash_sell.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
