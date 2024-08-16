import 'package:earn_store/Models/Home%20Models/general_info_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralInfoController extends GetxController {
  final generalInfos = Rxn<GeneralInfoModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getGeneralInfo() async {
    final response = await getNetworks.getData<GeneralInfoModel>(
      url: "/general-info",
      fromJson: (json) => GeneralInfoModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "General Info Status",
          description: left,
        );
      },
      (generalInfoData) async {
        generalInfos.value = generalInfoData;
      },
    );
  }

  String getBalance({required int userPoint, required num currencyPerPoint}) {
    final balance = userPoint * currencyPerPoint;
    debugPrint(balance.toString());
    return balance.toInt().toString();
  }
}
