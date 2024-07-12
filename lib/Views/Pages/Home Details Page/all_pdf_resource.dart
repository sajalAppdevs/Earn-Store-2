import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_pdf_resources_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllPdfResources extends StatelessWidget {
  const AllPdfResources({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "PDF & Resources",
          ),
          SizedBox(height: 20.h),
          const PaddedScreen(
            child: AllPDFResourcesBox(),
          ),
        ],
      ),
    );
  }
}
