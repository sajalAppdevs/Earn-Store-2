import 'package:earn_store/Models/Social%20Media%20Models/admin_chat_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AdminChatController extends GetxController {
  RxBool chatLoading = true.obs;
  RxBool sendMessageLoading = false.obs;
  final adminChats = Rxn<AdminChatModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getAdminChats({required String chatID}) async {
    chatLoading.value = true;
    final response = await getNetworks.getData<AdminChatModel>(
      url: "/get-chat?chat_id=$chatID",
      fromJson: (json) => AdminChatModel.fromJson(json),
    );
    response.fold(
      (left) {
        chatLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Admin Chat Status",
          description: left,
        );
      },
      (chatData) async {
        chatLoading.value = false;
        adminChats.value = chatData;
      },
    );
  }

  Future<void> sendMessege({
    required String message,
  }) async {
    sendMessageLoading.value = true;
    int userID = await LocalStorage.getUserID();

    final response = await postNetworks.postDataWithoutResponse(
      url: "/addToCart",
      body: {
        "customer_id": userID.toString(),
        "admin_id": adminChats.value!.chatDetails![0].adminId.toString(),
        "message": message,
        "chat_id": adminChats.value!.chatDetails![0].chatId.toString(),
      },
    );
    response.fold(
      (left) {
        sendMessageLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Message Status", description: "Failed to send Message");
      },
      (status) async {
        if (status == 200) {
          sendMessageLoading.value = false;
          Snackbars.successSnackBar(
            title: "Add To Cart Status",
            description: "Product added to cart",
          );
          await getAdminChats(
            chatID: adminChats.value!.chatDetails![0].chatId.toString(),
          );
        } else {
          sendMessageLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Message Status", description: "Failed to send Message");
        }
      },
    );
  }
}
