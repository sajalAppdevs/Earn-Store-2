import 'package:earn_store/Models/Social%20Media%20Models/news_paper_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class NewsPaperController extends GetxController {
  final newsPapers = Rxn<NewsPaperModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getNewsPaper() async {
    final response = await getNetworks.getData<NewsPaperModel>(
      url: "/get-newspaper",
      fromJson: (json) => NewsPaperModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "News Paper Status",
          description: left,
        );
      },
      (newsPapersData) async {
        newsPapers.value = newsPapersData;
      },
    );
  }
}
