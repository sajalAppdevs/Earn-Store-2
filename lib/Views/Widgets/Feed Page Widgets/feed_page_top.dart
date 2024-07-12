import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPageTop extends StatelessWidget {
  const FeedPageTop({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          feedLogo(),
          CustomField(
            hintText: "Search",
            controller: searchController,
            width: 180.w,
          ),
          chatLogo(),
        ],
      ),
    );
  }

  Widget feedLogo() {
    return Image.asset(
      "${Paths.iconPath}main_logo.png",
      height: 37.h,
      width: 45.w,
      fit: BoxFit.fill,
    );
  }

  Widget chatLogo() {
    return Image.asset(
      "${Paths.iconPath}messenger.png",
      height: 30.h,
      width: 30.w,
      fit: BoxFit.fill,
    );
  }
}
