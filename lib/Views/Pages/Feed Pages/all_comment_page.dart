import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/all_comment_body.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/all_comment_bottom.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/all_comment_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCommentPage extends StatelessWidget {
  const AllCommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        child: Column(
          children: [
            const AllCommentTop(),
            const AllCommentBody(),
            SizedBox(height: 20.h),
            const AllCommentBottom(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
