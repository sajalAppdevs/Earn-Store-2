import 'package:earn_store/Models/Social%20Media%20Models/social_media_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class SocialMediaController extends GetxController {
  RxBool socialMediaLoading = true.obs;
  final socialMedias = Rxn<SocialMediaModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getSocialMedia() async {
    socialMediaLoading.value = true;
    final response = await getNetworks.getData<SocialMediaModel>(
      url: "/get-posts",
      fromJson: (json) => SocialMediaModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Social Media Status",
          description: left,
        );
        socialMediaLoading.value = false;
      },
      (socialMediaInfo) async {
        socialMedias.value = socialMediaInfo;
        socialMediaLoading.value = false;
      },
    );
  }
}
