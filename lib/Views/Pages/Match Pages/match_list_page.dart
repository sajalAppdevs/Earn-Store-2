import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Match%20List%20Widget/match_box.dart';
import 'package:earn_store/Views/Widgets/Match%20List%20Widget/match_list_selector.dart';
import 'package:flutter/material.dart';

class MatchListPage extends StatelessWidget {
  const MatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "ICC Men’s T20 World Cup"),
          const MatchListSelector(),
          PaddedScreen(
            child: ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return MatchBox(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
