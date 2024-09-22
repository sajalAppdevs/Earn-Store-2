import 'package:earn_store/Models/Book%20Related%20Models/book_by_category_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BookByCategoryController extends GetxController {
  RxBool bookLoading = true.obs;
  final books = Rxn<BookByCategoryModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getBooksByCategories({
    required String categoryID,
  }) async {
    bookLoading.value = true;
    final response = await getNetworks.getData<BookByCategoryModel>(
      url: "/get-book-by-cat?cat_id=$categoryID",
      fromJson: (json) => BookByCategoryModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Book By Category Status",
          description: left,
        );
        bookLoading.value = false;
      },
      (booksData) async {
        books.value = booksData;
        bookLoading.value = false;
      },
    );
  }
}
