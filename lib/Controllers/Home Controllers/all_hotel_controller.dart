import 'package:earn_store/Models/Hotel%20Models/all_hotel_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllHotelController extends GetxController {
  RxBool hotelLoading = true.obs;
  final hotels = Rxn<AllHotelModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllHotels() async {
    hotelLoading.value = true;
    final response = await getNetworks.getData<AllHotelModel>(
      url: "/get-all-hotel",
      fromJson: (json) => AllHotelModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Hotel Status",
          description: left,
        );
        hotelLoading.value = false;
      },
      (hotelData) async {
        hotels.value = hotelData;
        hotelLoading.value = false;
      },
    );
  }
}
