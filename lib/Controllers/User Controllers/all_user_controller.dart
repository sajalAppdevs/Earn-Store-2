import 'package:earn_store/Models/User%20Models/all_user_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllUserController extends GetxController {
  RxBool allUserLoading = true.obs;
  final allUsers = Rxn<AllUserModel>();
  final searchUsers = Rxn<AllUserModel>();
  AllUserModel dummyData = AllUserModel(users: []);
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllUsers() async {
    allUserLoading.value = true;
    final response = await getNetworks.getData<AllUserModel>(
      url: "/get-all-users",
      fromJson: (json) => AllUserModel.fromJson(json),
    );
    response.fold(
      (left) {
        allUserLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "All User Status",
          description: left,
        );
      },
      (allUsersData) async {
        allUsers.value = allUsersData;
        searchUsers.value = allUsersData;
        allUserLoading.value = false;
      },
    );
  }

  void filterUser({required String value}) {
    if (value.isEmpty) {
      allUsers.value = searchUsers.value;
    } else {
      dummyData.users = searchUsers.value!.users!.where((element) {
        String name = element.name.toString().toLowerCase();
        String email = element.email.toString().toLowerCase();
        String phoneNumber = element.mobile.toString().toLowerCase();
        return name.contains(value.toLowerCase()) ||
            email.contains(value.toLowerCase()) ||
            phoneNumber.contains(value.toLowerCase());
      }).toList();
      allUsers.value = AllUserModel(users: dummyData.users);
    }
  }
}
