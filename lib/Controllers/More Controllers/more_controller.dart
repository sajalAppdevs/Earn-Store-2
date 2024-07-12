import 'package:earn_store/Views/Pages/More%20Pages/change_pass_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/leader_board_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/level_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/live_chat_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/run_ads_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/update_package_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/profile_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/refer_list_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/spin_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/total_earning_page.dart';
import 'package:get/get.dart';

class MoreController extends GetxController {
  void moreNavigator({required int index}) {
    if (index == 0) {
      Get.to(
        const ProfilePage(),
      );
    } else if (index == 1) {
      Get.to(
        const LeaderBoardPage(),
      );
    } else if (index == 2) {
      Get.to(
        const ReferListPage(),
      );
    } else if (index == 3) {
      Get.to(
        const SpinPage(),
      );
    } else if (index == 4) {
      Get.to(
        const TotalEarningPage(),
      );
    } else if (index == 5) {
      Get.to(
        const LevelPage(),
      );
    } else if (index == 6) {
      Get.to(
        const UpdatePackagePage(),
      );
    } else if (index == 7) {
      Get.to(
        const RunAdsPage(),
      );
    } else if (index == 8) {
      Get.to(
        const ChangePagePage(),
      );
    } else if (index == 9) {
      Get.to(
        const LiveChatPage(),
      );
    }
  }
}
