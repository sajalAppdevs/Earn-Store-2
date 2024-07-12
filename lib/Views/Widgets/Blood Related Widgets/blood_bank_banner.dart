import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodBankBanner extends StatelessWidget {
  const BloodBankBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: 180.h,
      child: Image.asset(
        "${Paths.iconPath}blood_banner.png",
        height: 155.h,
        width: 340.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
