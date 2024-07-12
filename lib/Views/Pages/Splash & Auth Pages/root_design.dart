import 'package:flutter/material.dart';

class RootDesign extends StatelessWidget {
  final Widget child;
  const RootDesign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
