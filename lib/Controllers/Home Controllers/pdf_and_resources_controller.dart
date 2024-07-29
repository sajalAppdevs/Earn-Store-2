import 'package:earn_store/Models/Home%20Models/pdf_and_resources_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PDFAndResourcesController extends GetxController {
  RxBool resourceLoading = true.obs;
  final pdfAndResources = Rxn<PDFAndResourcesModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllResources() async {
    resourceLoading.value = true;
    final response = await getNetworks.getData<PDFAndResourcesModel>(
      url: "/get-pdf",
      fromJson: (json) => PDFAndResourcesModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Resources Status",
          description: left,
        );
        resourceLoading.value = false;
      },
      (resourcesData) async {
        pdfAndResources.value = resourcesData;
        resourceLoading.value = false;
      },
    );
  }
}
