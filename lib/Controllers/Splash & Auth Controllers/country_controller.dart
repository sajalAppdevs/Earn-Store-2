import 'package:earn_store/Models/Auth%20Models/country_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  RxBool countryLoading = true.obs;
  RxString countryText = "Select Country".obs;
  RxInt countryID = 0.obs;
  final counties = Rxn<CountryModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getCountry() async {
    countryLoading.value = true;
    final response = await getNetworks.getData<CountryModel>(
      url: "/get-country",
      fromJson: (json) => CountryModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Country Status",
          description: left,
        );
        countryLoading.value = false;
      },
      (countryData) async {
        counties.value = countryData;
        countryLoading.value = false;
      },
    );
  }

  void setCountry({required int value}) {
    countryID.value = value;
    for (var element in counties.value!.countrys!) {
      if (element.id == countryID.value) {
        countryText.value = element.name.toString();
      }
    }
  }

  void setCountryEmpty() {
    countryID.value = 0;
    countryText.value = "Select Country";
  }
}
