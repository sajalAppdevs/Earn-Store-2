import 'package:earn_store/Models/Home%20Models/quiz_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxBool quizLoading = true.obs;
  RxBool submitQuizLoading = false.obs;
  final quiz = Rxn<QuizModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getQuiz() async {
    quizLoading.value = true;
    final response = await getNetworks.getData<QuizModel>(
      url: "/get-quiz",
      fromJson: (json) => QuizModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Quiz Status",
          description: left,
        );
        quizLoading.value = false;
      },
      (quizData) async {
        quiz.value = quizData;
        quizLoading.value = false;
      },
    );
  }

  Future<void> submitQuiz({
    required String quizID,
    required String answer,
  }) async {
    submitQuizLoading.value = true;
    int userID = await LocalStorage.getUserID();

    final response = await postNetworks.postDataWithoutResponse(
      url: "/submit-quiz",
      body: {
        "user_id": userID.toString(),
        "quiz_id": quizID,
        "answer": answer,
      },
    );
    response.fold(
      (left) {
        submitQuizLoading.value = false;
        Snackbars.unSuccessSnackBar(
            title: "Quiz Status", description: "Failed to submit quiz");
      },
      (status) async {
        if (status == 200) {
          submitQuizLoading.value = false;
          Snackbars.successSnackBar(
              title: "Quiz Status", description: "Quiz Submitted");
          Get.offAll(
            const RootScreen(),
          );
        } else {
          submitQuizLoading.value = false;
          Snackbars.unSuccessSnackBar(
              title: "Quiz Status", description: "Failed to submit quiz");
        }
      },
    );
  }
}
