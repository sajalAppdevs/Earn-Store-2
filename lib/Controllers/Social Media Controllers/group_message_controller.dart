import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Models/Social%20Media%20Models/group_message_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class GroupMessegeController extends GetxController {
  RxBool messegeLoading = true.obs;
  RxBool sendMessegeLoading = false.obs;
  final messages = Rxn<GroupMessageModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getMessages({required String convoID}) async {
    messegeLoading.value = true;
    final response = await getNetworks.getData<GroupMessageModel>(
      url: "/group-conversations?grp_conv_id=$convoID",
      fromJson: (json) => GroupMessageModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Message Status",
          description: left,
        );
        messegeLoading.value = false;
      },
      (messegeInfo) async {
        messages.value = messegeInfo;
        messegeLoading.value = false;
      },
    );
    messages.value!.data!.messages =
        messages.value!.data!.messages!.reversed.toList();
  }

  Future<void> sendMessage({
    required String message,
    required String convoID,
  }) async {
    sendMessegeLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/group-messages",
      body: {
        "grp_conv_id": convoID.toString(),
        "from_id": userID.toString(),
        "message": message,
      },
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Message Status",
          description: left,
        );
        sendMessegeLoading.value = false;
      },
      (loginData) async {
        sendMessegeLoading.value = false;
        await getMessages(convoID: convoID);
      },
    );
  }

  // String nameSelector() {
  //   UserProfileController userProfileController =
  //       Get.put(UserProfileController());
  //   if (messages.value!.data!.messages![0].fromId !=
  //       userProfileController.userData.value!.user!.userid!.toInt()) {
  //     return messages.value!.data!.messages![0].fromUserName.toString();
  //   } else {
  //     return messages.value!.data!.messages![0].toUserName.toString();
  //   }
  // }

  // String idSelector() {
  //   UserProfileController userProfileController =
  //       Get.put(UserProfileController());
  //   if (messages.value!.data!.messages![0].fromId !=
  //       userProfileController.userData.value!.user!.userid!.toInt()) {
  //     return messages.value!.data!.messages![0].fromId.toString();
  //   } else {
  //     return messages.value!.data!.messages![0].toId.toString();
  //   }
  // }

  bool userSelector({required int index}) {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    if (messages.value!.data!.messages![index].fromId ==
        userProfileController.userData.value!.user!.userid!.toInt()) {
      return true;
    } else {
      return false;
    }
  }
}
