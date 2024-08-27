import 'package:earn_store/Views/Widgets/Home%20Widgets/notification_box.dart';
import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return NotificationBox(index: index);
      },
    );
    
  }
}
