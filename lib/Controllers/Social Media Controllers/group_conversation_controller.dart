import 'package:earn_store/Models/Social%20Media%20Models/group_conversation_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class GroupConversationController extends GetxController {
  RxBool conversationLoading = true.obs;
  final conversations = Rxn<GroupConversationModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getGroupConversation() async {
    conversationLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<GroupConversationModel>(
      url: "/group-conversations-user?from_id=$userID",
      fromJson: (json) => GroupConversationModel.fromJson(json),
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
}
