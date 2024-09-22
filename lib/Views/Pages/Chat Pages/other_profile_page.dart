import 'package:earn_store/Controllers/Social%20Media%20Controllers/message_other_user_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/other_profile_controller.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/other_profile_body.dart';
import 'package:earn_store/Views/Widgets/Chat%20Page%20Widgets/other_profile_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherProfilePage extends StatefulWidget {
  final String userID;
  const OtherProfilePage({super.key, required this.userID});

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  OtherProfileController otherProfileController =
      Get.put(OtherProfileController());
  MessageOtherUserController messageOtherUserController = Get.put(
    MessageOtherUserController(),
  );
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await otherProfileController.getOtherProfile(userID: widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return otherProfileController.otherProfileLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "Profile"),
                    PaddedScreen(
                      child: Column(
                        children: [
                          const OtherProfileTop(),
                          SizedBox(height: 15.h),
                          const OtherProfileBody(),
                          SizedBox(height: 50.h),
                          messageOtherUserController.messageSendLoading.value
                              ? const ButtonLoading()
                              : CustomButton(
                                  onPressed: () async {
                                    await messageOtherUserController
                                        .sendMessage(
                                      receiverID: otherProfileController
                                          .otherProfile.value!.user!.userid!
                                          .toInt(),
                                    );
                                  },
                                  buttonText: "Message",
                                ),
                          SizedBox(height: 80.h),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
