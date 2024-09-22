import 'package:earn_store/Controllers/Social%20Media%20Controllers/admin_chat_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LiveChatBottom extends StatelessWidget {
  const LiveChatBottom({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messegeController = TextEditingController();
    return PaddedScreen(
      padding: 15.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          messegeField(messegeController: messegeController),
          sendButton(messageController: messegeController),
        ],
      ),
    );
  }

  Widget messegeField({required TextEditingController messegeController}) {
    return GlassmorphismCard(
      boxHeight: 45.h,
      boxWidth: 210.w,
      borderRadius: 30.r,
      horizontalPadding: 20.w,
      child: TextField(
        controller: messegeController,
        style: TextStyles.fieldTextStyle(),
        decoration: InputDecoration(
          hintText: "message....",
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: TextStyles.fieldHintStyle(),
        ),
      ),
    );
  }

  Widget sendButton({required TextEditingController messageController}) {
    AdminChatController controller = Get.put(AdminChatController());
    return Obx(
      () {
        return controller.sendMessageLoading.value
            ? ButtonLoading(
                loadingSize: 18.sp,
              )
            : GlassmorphismCard(
                boxHeight: 45.h,
                boxWidth: 100.w,
                borderRadius: 30.r,
                horizontalPadding: 20.w,
                onPressed: () async {
                  await controller.sendMessege(
                    message: messageController.text,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyles.customText(
                      title: "Send",
                      fontSize: 12.sp,
                    ),
                    Image.asset(
                      "${Paths.iconPath}send.png",
                      height: 16.h,
                      width: 16.w,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              );
      },
    );
  }
}
