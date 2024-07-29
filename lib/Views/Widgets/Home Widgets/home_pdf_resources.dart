import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/pdf_and_resources_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_pdf_resource.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/pdf_resources_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePDFResources extends StatelessWidget {
  const HomePDFResources({super.key});

  @override
  Widget build(BuildContext context) {
    PDFAndResourcesController controller = Get.put(PDFAndResourcesController());
    return Obx(
      () {
        return controller.resourceLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                child: Column(
                  children: [
                    TitleText(
                      title: "PDF & Resource",
                      onPressed: () {
                        Get.to(
                          const AllPdfResources(),
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    resources(),
                  ],
                ),
              );
      },
    );
  }

  Widget resources() {
    PDFAndResourcesController controller = Get.put(PDFAndResourcesController());
    return Obx(
      () {
        return Column(
          children: List.generate(
            controller.pdfAndResources.value!.pdfs!.length > 3
                ? 3
                : controller.pdfAndResources.value!.pdfs!.length,
            (index) {
              String imagePath = controller
                  .pdfAndResources.value!.pdfs![index].image
                  .toString();
              String name = imagePath = controller
                  .pdfAndResources.value!.pdfs![index].title
                  .toString();
              String price = imagePath = controller
                  .pdfAndResources.value!.pdfs![index].price
                  .toString();
              return Padding(
                padding: EdgeInsets.only(bottom: 15.w),
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
                                title: price,
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
          ),
        );
      },
    );
  }

  Widget resourceImage({required String imagePath}) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 55.h,
        width: 92.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const ButtonLoading(
        loadingColor: TextColors.textColor1,
      ),
      errorWidget: (context, url, error) => Container(
        height: 55.h,
        width: 92.w,
        color: Colors.grey,
      ),
    );
  }
}
