import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/pdf_resources_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PDFResourcesDetails extends StatelessWidget {
  const PDFResourcesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Pdf & Resources"),
          SizedBox(height: 10.h),
          const PDFResourcesDetailsBody(),
        ],
      ),
    );
  }
}
