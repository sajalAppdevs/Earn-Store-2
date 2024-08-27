import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({super.key});

  @override
  State<SpinPage> createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  bool isSpinning = false;
  double rotationAngle = 0.0;
  Duration spinDuration = const Duration(seconds: 10);
  double rotationSpeed = 15.0; // Increase initial speed

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(title: "Spin"),
          PaddedScreen(
            padding: 15.w,
            child: Column(
              children: [
                SizedBox(height: 100.h),
                AnimatedRotation(
                  turns: rotationAngle / 360,
                  duration: spinDuration,
                  curve: Curves.easeOutCubic,
                  child: spinImage(),
                ),
                CustomButton(
                  width: 150.w,
                  onPressed: () async {
                    if (!isSpinning) {
                      setState(() {
                        isSpinning = true;
                        rotationAngle = 0.0;
                        rotationSpeed = 15.0; // Increase initial speed
                      });

                      while (isSpinning) {
                        setState(() {
                          rotationAngle += rotationSpeed;
                          rotationSpeed -= 0.05; // Decrease speed decrement
                          if (rotationSpeed <= 0.0) {
                            isSpinning = false;
                          }
                        });
                        // await Future.delayed(const Duration(milliseconds: 10));
                      }
                    }
                  },
                  buttonText: "Run Spin",
                  textSize: 16.sp,
                ),
                SizedBox(height: 30.h),
                customText(
                  title:
                      "Your refer num is 102. You can run this Spin when it will be 105.",
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget spinImage() {
    return Container(
      height: 157,
      width: 157,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            "${Paths.iconPath}spin_big.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      isShowAll: true,
    );
  }
}
