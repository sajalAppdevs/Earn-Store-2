import 'package:earn_store/Controllers/Home%20Controllers/quiz_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Category%20Widgets/quiz_test_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizTestPage extends StatefulWidget {
  const QuizTestPage({super.key});

  @override
  State<QuizTestPage> createState() => _QuizTestPageState();
}

class _QuizTestPageState extends State<QuizTestPage> {
  QuizController controller = Get.put(QuizController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    controller.getQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.quizLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  children: const [
                    CustomTop(title: "Daily Quiz"),
                    QuizTestBody(),
                  ],
                ),
              );
      },
    );
  }
}
