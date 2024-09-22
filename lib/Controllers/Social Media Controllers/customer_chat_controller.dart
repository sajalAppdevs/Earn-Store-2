import 'package:earn_store/Models/Social%20Media%20Models/create_chat_model.dart';
import 'package:earn_store/Models/Social%20Media%20Models/customer_chat_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/More%20Pages/live_chat_page.dart';
import 'package:get/get.dart';

class CustomerChatController extends GetxController {
  final customerChats = Rxn<CustomerChatModel>();
  final createChats = Rxn<CreateChatModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getCustomerChat() async {
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<CustomerChatModel>(
      url: "/get-chat-id?customer_id=$userID",
      fromJson: (json) => CustomerChatModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Customer Chat Status",
          description: left,
        );
      },
      (customerChatData) async {
        customerChats.value = customerChatData;
        if (customerChats.value!.chatIds!.isEmpty) {
          await createChat();
          Get.to(
            LiveChatPage(
              chatID: createChats.value!.chatId.toString(),
            ),
          );
        } else {
          Get.to(
            LiveChatPage(
              chatID: customerChatData.chatIds![0].toString(),
            ),
          );
        }
      },
    );
  }

  Future<void> createChat() async {
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postData<CreateChatModel>(
      fromJson: (json) => CreateChatModel.fromJson(json),
      url: "/start-chat",
      body: {
        "customer_id": userID.toString(),
      },
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
            title: "Start Chat Status", description: "Failed to start Chat");
      },
      (chatData) {
        createChats.value = chatData;
      },
    );
  }
}
