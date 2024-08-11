import 'package:earn_store/Controllers/Food%20Related%20Controllers/food_details_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Food%20Related%20Widgets/food_details_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodDetailsPage extends StatefulWidget {
  final String foodID;
  const FoodDetailsPage({super.key, required this.foodID});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  FoodDetailsController controller = Get.put(FoodDetailsController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getFoodDetails(foodID: widget.foodID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.foodLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const FoodDetailsTop(title: "Order Details"),
                    PaddedScreen(
                      child: CustomField(
                        hintText: "Search",
                        controller: TextEditingController(),
                        suffixIcon: Icons.search,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    productImage(),
                    PaddedScreen(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          productName(),
                          SizedBox(height: 15.h),
                          customText(
                              title:
                                  "Category : ${controller.foodDetails.value!.data!.catName}"),
                          SizedBox(height: 15.h),
                          customText(
                              title:
                                  "Product ID : ${controller.foodDetails.value!.data!.id}"),
                          SizedBox(height: 15.h),
                          locationWidget(),
                          SizedBox(height: 30.h),
                          productDescriptionTitle(),
                          SizedBox(height: 15.h),
                          TextStyles.customText(
                            title: controller
                                .foodDetails.value!.data!.description
                                .toString(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            isShowAll: true,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                            onPressed: () {},
                            buttonText: "Order Now",
                          ),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget productImage() {
    return Obx(
      () {
        return PaddedScreen(
          padding: 30.w,
          child: GlassmorphismCard(
            boxHeight: 200.h,
            boxWidth: 300.w,
            child: NetworkImageWidget(
              imageUrl: controller.foodDetails.value!.data!.image.toString(),
              height: 170.h,
              width: 270.w,
            ),
          ),
        );
      },
    );
  }

  Widget productName() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
                title: controller.foodDetails.value!.data!.name.toString()),
            TextStyles.customText(
              title: "BDT : ${controller.foodDetails.value!.data!.price}",
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ],
        );
      },
    );
  }

  Widget customText({required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextStyles.customText(
        title: title,
        fontSize: 15.sp,
      ),
    );
  }

  Widget locationWidget() {
    return Row(
      children: [
        Image.asset(
          "${Paths.iconPath}location.png",
          height: 20.h,
          width: 18.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 5.w),
        TextStyles.customText(
          title: "4km",
          fontSize: 14.sp,
        )
      ],
    );
  }

  Widget productDescriptionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title: "Product Description"),
        CustomButton(
          height: 35.h,
          width: 120.w,
          onPressed: () {},
          buttonText: "Check Reviews",
          textSize: 10.sp,
        )
      ],
    );
  }
}
