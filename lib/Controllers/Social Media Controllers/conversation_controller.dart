import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Models/Social%20Media%20Models/conversation_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class ConversationController extends GetxController {
  RxBool isSoloConvo = true.obs;
  RxBool conversationLoading = true.obs;
  final conversations = Rxn<ConversationModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getAllConversation() async {
    conversationLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<ConversationModel>(
      url: "/get-conversation?from=$userID",
      fromJson: (json) => ConversationModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Conversation Status",
          description: left,
        );
        conversationLoading.value = false;
      },
      (conversationInfo) async {
        conversations.value = conversationInfo;
        conversationLoading.value = false;
      },
    );
  }

  String imageSelector({required int index}) {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    if (conversations.value!.member![index].member1!.toInt() !=
        userProfileController.userData.value!.user!.userid!.toInt()) {
      return conversations.value!.member![index].member1Image.toString();
    } else {
      return conversations.value!.member![index].member2Image.toString();
    }
  }

  String nameSelector({required int index}) {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    if (conversations.value!.member![index].member1!.toInt() !=
        userProfileController.userData.value!.user!.userid!.toInt()) {
      return conversations.value!.member![index].member1Name.toString();
    } else {
      return conversations.value!.member![index].member2Name.toString();
    }
  }

  String messegeSelector({required int index}) {
    UserProfileController userProfileController =
        Get.put(UserProfileController());
    if (conversations.value!.member![index].member1!
            .toInt() !=
        userProfileController.userData.value!.user!.userid!.toInt()) {
      return conversations.value!.member![index].member1Name
          .toString();
    } else {
      return conversations.value!.member![index].member2Name
          .toString();
    }
  }

  void changeConvoType({required bool value}) {
    isSoloConvo.value = value;
  }
}
