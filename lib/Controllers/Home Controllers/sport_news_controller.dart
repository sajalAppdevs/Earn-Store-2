import 'package:earn_store/Models/Home%20Models/sport_news_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class SportNewsController extends GetxController {
  RxBool newsLoading = true.obs;
  final newsUpdates = Rxn<SportNewsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getSportNews() async {
    newsLoading.value = true;
    final response = await getNetworks.getData<SportNewsModel>(
      url: "/get-sport-news",
      fromJson: (json) => SportNewsModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Sport News Status",
          description: left,
        );
        newsLoading.value = false;
      },
      (newsData) async {
        newsUpdates.value = newsData;
        newsLoading.value = false;
      },
    );
  }
}
