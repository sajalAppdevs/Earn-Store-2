import 'package:earn_store/Models/User%20Models/operators_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class OperatorController extends GetxController {
  RxInt operatorID = 0.obs;
  RxInt withdrawMethodIndex = 0.obs;
  RxBool methodsLoading = true.obs;
  final operators = Rxn<AllOperatorsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getOperators() async {
    methodsLoading.value = true;
    final response = await getNetworks.getData<AllOperatorsModel>(
      url: "/operator",
      fromJson: (json) => AllOperatorsModel.fromJson(json),
    );
    response.fold(
      (left) {
        methodsLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Operator Status",
          description: left,
        );
      },
      (operatorsData) async {
        operators.value = operatorsData;
        operatorID.value = operators.value!.operator![0].id!.toInt();
        methodsLoading.value = false;
      },
    );
  }

  void setOperators({required int index}) {
    withdrawMethodIndex.value = index;
    operatorID.value = operators.value!.operator![index].id!.toInt();
  }
}
