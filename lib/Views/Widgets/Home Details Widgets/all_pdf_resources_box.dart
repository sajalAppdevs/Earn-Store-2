import 'package:earn_store/Controllers/Home%20Controllers/pdf_and_resources_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/pdf_resources_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllPDFResourcesBox extends StatelessWidget {
  const AllPDFResourcesBox({super.key});

  @override
  Widget build(BuildContext context) {
    PDFAndResourcesController controller = Get.put(
      PDFAndResourcesController(),
    );
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.pdfAndResources.value!.pdfs!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return pdfAndResources(index: index);
          },
        );
      },
    );
  }

  Widget pdfAndResources({required int index}) {
    PDFAndResourcesController controller = Get.put(PDFAndResourcesController());
    return Obx(
      () {
        String imagePath =
            controller.pdfAndResources.value!.pdfs![index].image.toString();
        String name = imagePath =
            controller.pdfAndResources.value!.pdfs![index].title.toString();
        String price = imagePath =
            controller.pdfAndResources.value!.pdfs![index].price.toString();
        return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: GlassmorphismCard(
            boxHeight: 85.h,
            onPressed: () {
              Get.to(
                const PDFResourcesDetails(),
              );
            },
            horizontalPadding: 10.w,
            verticalPadding: 10.h,
            child: Row(
              children: [
                resourceImage(imagePath: imagePath),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.customText(
                      title: name,
                      fontSize: 12.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        TextStyles.customText(
                          title: "$price Taka",
                          fontSize: 14.sp,
                          color: TextColors.textColor3,
                        ),
                        SizedBox(width: 50.w),
                        Container(
                          height: 30.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ButtonColors.buttonColor1,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: TextStyles.customText(
                            title: "Details",
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget resourceImage({required String imagePath}) {
    return NetworkImageWidget(
      imageUrl: imagePath,
      height: 55.h,
      width: 92.w,
    );
  }
}
