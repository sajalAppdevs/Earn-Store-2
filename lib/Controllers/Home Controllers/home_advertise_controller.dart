import 'package:earn_store/Models/Home%20Models/banner_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class HomeAdvertiseController extends GetxController {
  RxBool bannerLoading = true.obs;
  RxInt sliderIndex = 0.obs;
  final banners = Rxn<BannerModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getBanners() async {
    bannerLoading.value = true;
    final response = await getNetworks.getData<BannerModel>(
      url: "/banner",
      fromJson: (json) => BannerModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Banner Status",
          description: left,
        );
        bannerLoading.value = false;
      },
      (bannersData) async {
        banners.value = bannersData;
        bannerLoading.value = false;
      },
    );
  }

  void setSliderIndex({required int value}) {
    sliderIndex.value = value;
  }
}
