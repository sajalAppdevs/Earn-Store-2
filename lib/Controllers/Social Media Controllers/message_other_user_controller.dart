import 'package:earn_store/Controllers/Social%20Media%20Controllers/conversation_controller.dart';
import 'package:earn_store/Models/Social%20Media%20Models/add_conversation_model.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/solo_chat_details_page.dart';
import 'package:get/get.dart';

class MessageOtherUserController extends GetxController {
  RxBool messageSendLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  ConversationController conversationController = Get.put(
    ConversationController(),
  );
  Future<void> sendMessage({required int receiverID}) async {
    messageSendLoading.value = true;
    await conversationController.getAllConversation();
    bool status = true;
    int convoID = 0;
    for (var element in conversationController.conversations.value!.member!) {
      if (element.member1 == receiverID || element.member2 == receiverID) {
        status = false;
        convoID = element.id!.toInt();
        break;
      }
    }
    if (status) {
      await addConversation(
        receiverID: receiverID.toString(),
      );
      messageSendLoading.value = false;
    } else {
      messageSendLoading.value = false;
      Get.to(
        SoloChatDetailsPage(
          convoID: convoID.toString(),
          othersID: receiverID.toString(),
        ),
      );
    }
  }

  Future<void> addConversation({
    required String receiverID,
  }) async {
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postData<AddConversationModel>(
      url: "/add-conversation",
      body: {
        "member1": receiverID,
        "member2": userID.toString(),
      },
      fromJson: (json) => AddConversationModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Send Message Status",
          description: "Failed to send message",
        );
      },
      (chatData) {
        String otherID = "0";
        if (chatData.conversation!.member1 == userID.toString()) {
          otherID = chatData.conversation!.member2.toString();
        } else {
          otherID = chatData.conversation!.member1.toString();
        }
        Get.to(
          SoloChatDetailsPage(
            convoID: chatData.conversation!.id.toString(),
            othersID: otherID,
          ),
        );
      },
    );
  }
}
