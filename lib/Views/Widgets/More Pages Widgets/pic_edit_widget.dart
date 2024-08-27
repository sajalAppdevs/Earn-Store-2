import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_edit_controller.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PicEditWidget extends StatefulWidget {
  final AsyncCallback onPressed;
  final String imagePath;
  const PicEditWidget({
    super.key,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  State<PicEditWidget> createState() => _PicEditWidgetState();
}

class _PicEditWidgetState extends State<PicEditWidget> {
  UserEditController controller = UserEditController();

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 15.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextStyles.customText(
            title: "Display Photo",
          ),
          GestureDetector(
            onTap: () async {
              await widget.onPressed();
            },
            child: imageBox(),
          ),
        ],
      ),
    );
  }

  Widget imageBox() {
    return widget.imagePath.isEmpty
        ? userImageFromServer()
        : ClipOval(
            child: Image.file(
              File(widget.imagePath),
              height: 36.h,
              width: 36.w,
              fit: BoxFit.cover,
            ),
          );
  }

  Widget userImageFromServer() {
    UserProfileController controller = Get.put(UserProfileController());
    return Obx(
      () {
        return CachedNetworkImage(
          imageUrl: controller.userData.value!.user!.imageUrl.toString(),
          imageBuilder: (context, imageProvider) => Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const ButtonLoading(),
          errorWidget: (context, url, error) => Container(
            height: 36.h,
            width: 36.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "${Paths.imagePath}blank_image.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
