import 'package:earn_store/Models/Book%20Related%20Models/book_categories_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class BookCategoryController extends GetxController {
  RxBool categoryLoading = true.obs;
  final categories = Rxn<BookCategoriesModel>();
  GetNetworks getNetworks = GetNetworks();
  Future<void> getBookCategories() async {
    categoryLoading.value = true;
    final response = await getNetworks.getData<BookCategoriesModel>(
      url: "/get-book-cat",
      fromJson: (json) => BookCategoriesModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Book Category Status",
          description: left,
        );
        categoryLoading.value = false;
      },
      (categoryData) async {
        categories.value = categoryData;
        categoryLoading.value = false;
      },
    );
  }
}
