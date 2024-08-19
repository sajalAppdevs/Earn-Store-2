import 'package:earn_store/Models/Home%20Models/content_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  RxBool contentLoading = true.obs;
  final contents = Rxn<ContentModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getStreamingContent() async {
    contentLoading.value = true;
    final response = await getNetworks.getData<ContentModel>(
      url: "/get-streaming-hub",
      fromJson: (json) => ContentModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Content Status",
          description: left,
        );
        contentLoading.value = false;
      },
      (contentData) async {
        contents.value = contentData;
        contentLoading.value = false;
      },
    );
  }
}
