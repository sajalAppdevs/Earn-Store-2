import 'package:earn_store/Models/Hotel%20Models/all_hotel_model.dart';
import 'package:earn_store/Models/Hotel%20Models/hotel_details_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllHotelController extends GetxController {
  RxBool hotelLoading = true.obs;
  final hotels = Rxn<AllHotelModel>();
  final hotelDetails = Rxn<HotelDetailsModel>();
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

  Future<void> getHotelDetails({required String hotelID}) async {
    final response = await getNetworks.getData<HotelDetailsModel>(
      url: "/get-hotel?id=$hotelID",
      fromJson: (json) => HotelDetailsModel.fromJson(json),
    );
    response.fold(
      (left) {
        debugPrint(left);
      },
      (hotelData) async {
        hotelDetails.value = hotelData;
      },
    );
  }
}
