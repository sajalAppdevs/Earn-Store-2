import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/ecommerce_product_list.dart';
import 'package:earn_store/Views/Widgets/Ecommerce%20Related%20Widgets/ecommerce_top.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_flash_sell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommercePage extends StatefulWidget {
  const EcommercePage({
    super.key,
  });

  @override
  State<EcommercePage> createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const EcommerceTop(
            title: "Ecommerce",
          ),
          PaddedScreen(
            child: CustomField(
              hintText: "Search",
              controller: searchController,
              suffixIcon: Icons.search,
              onPressed: (value) {},
            ),
          ),
          SizedBox(height: 30.h),
          PaddedScreen(
            padding: 15.w,
            child: const HomeFlashSell(),
          ),
          SizedBox(height: 30.h),
          const EcommerceProductList(),
        ],
      ),
    );
  }
}
