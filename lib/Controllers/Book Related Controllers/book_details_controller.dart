import 'package:earn_store/Models/Book%20Related%20Models/book_details_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController {
  RxBool bookLoading = true.obs;
  final bookDetails = Rxn<BookDetailsModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getBookDetails({
    required String bookID,
  }) async {
    bookLoading.value = true;
    final response = await getNetworks.getData<BookDetailsModel>(
      url: "/get-book-by-id?book_id=$bookID",
      fromJson: (json) => BookDetailsModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Book Details Status",
          description: left,
        );
        bookLoading.value = false;
      },
      (categoryData) async {
        bookDetails.value = categoryData;
        bookLoading.value = false;
      },
    );
  }
}
