import 'package:earn_store/Views/Pages/Blood%20Related%20Pages/blood_bank.dart';
import 'package:earn_store/Views/Pages/Category%20Pages/live_tv_page.dart';
import 'package:earn_store/Views/Pages/Category%20Pages/news_paper_page.dart';
import 'package:earn_store/Views/Pages/Category%20Pages/parcel_page.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/ecommerce_page.dart';
import 'package:earn_store/Views/Pages/Food%20Related%20Page/food_delivery_page.dart';
import 'package:earn_store/Views/Pages/Ride%20Share%20Pages/ride_share_page.dart';
import 'package:earn_store/Views/Pages/Tour%20Related%20Pages/tour_page.dart';
import 'package:get/get.dart';

class HomeCategoriesController extends GetxController {
  void categoriesNavigator({
    required int index,
  }) {
    if (index == 0) {
      Get.to(
        const EcommercePage(),
      );
    } else if (index == 1) {
      Get.to(
        const NewsPaperPage(),
      );
    } else if (index == 2) {
      Get.to(
        const LiveTVPage(),
      );
    } else if (index == 3) {
      Get.to(
        const BloodBank(),
      );
    } else if (index == 4) {
      Get.to(
        const FoodDeliveryPage(),
      );
    } else if (index == 5) {
      Get.to(
        const RideSharePage(),
      );
    } else if (index == 6) {
      Get.to(
        const ParcelPage(),
      );
    } else if (index == 7) {
      Get.to(
        const TourPage(),
      );
    }
  }
}
