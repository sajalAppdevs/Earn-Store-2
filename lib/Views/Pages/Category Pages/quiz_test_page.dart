import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Category%20Widgets/quiz_test_body.dart';
import 'package:flutter/material.dart';

class QuizTestPage extends StatelessWidget {
  const QuizTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        children: const [
          CustomTop(title: "Daily Quiz"),
          QuizTestBody(),
        ],
      ),
    );
  }
}
