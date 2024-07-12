import 'package:earn_store/Views/Pages/Food%20Related%20Page/food_list.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Food%20Related%20Widgets/food_delivery_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDeliveryDetails extends StatelessWidget {
  const FoodDeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const FoodDeliveryDetailsTop(),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: TextEditingController(),
              suffixIcon: Icons.search,
            ),
          ),
          SizedBox(height: 30.h),
          const FoodList()
        ],
      ),
    );
  }
}
