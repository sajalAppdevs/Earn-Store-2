import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/all_user_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/other_profile_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/profile_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({
    super.key,
  });

  @override
  State<AllUserPage> createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  TextEditingController searchController = TextEditingController();
  AllUserController controller = Get.put(AllUserController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.allUserLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CustomTop(title: "All Users"),
                    PaddedScreen(
                      child: CustomField(
                        hintText: "Search",
                        controller: searchController,
                        suffixIcon: Icons.search,
                        onPressed: (value) {
                          controller.filterUser(value: searchController.text);
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ListView.builder(
                      itemCount: controller.allUsers.value!.users!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return userBox(index: index);
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
      },
    );
  }

  Widget userBox({required int index}) {
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: GestureDetector(
            onTap: () async {
              int userID = await LocalStorage.getUserID();
              controller.allUsers.value!.users![index].userid!.toInt() == userID
                  ? Get.to(const ProfilePage())
                  : Get.to(
                      OtherProfilePage(
                        userID: controller.allUsers.value!.users![index].userid
                            .toString(),
                      ),
                    );
            },
            child: Row(
              children: [
                userImage(index: index),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.customText(
                      title: controller.allUsers.value!.users![index].name
                          .toString(),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 3.h),
                    TextStyles.customText(
                      title: controller.allUsers.value!.users![index].email
                          .toString(),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget userImage({required int index}) {
    return CachedNetworkImage(
      imageUrl: controller.allUsers.value!.users![index].imageUrl.toString(),
      imageBuilder: (context, imageProvider) => Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => ButtonLoading(
        loadingSize: 15.sp,
      ),
      errorWidget: (context, url, error) => Container(
        height: 70.h,
        width: 70.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "${Paths.imagePath}blank_image.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
