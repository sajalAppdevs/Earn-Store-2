import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/country_controller.dart';
import 'package:earn_store/Controllers/Splash%20&%20Auth%20Controllers/register_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/auth_top_logo.dart';
import 'package:earn_store/Views/Common%20Widgets/non_glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/login_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/fields.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Widgets/Splash%20&%20Auth%20Widgets/country_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  CountryController countryController = Get.put(CountryController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await countryController.getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return countryController.countryLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 40.h),
                    const AuthTopLogo(),
                    SizedBox(height: 10.h),
                    TextStyles.customText(
                      title: "REGISTER",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 40.h),
                    registerBoxBox(),
                    SizedBox(height: 50.h),
                    loginText(),
                    SizedBox(height: 50.h),
                  ],
                ),
              );
      },
    );
  }

  Widget registerBoxBox() {
    RegisterController registerController = Get.put(RegisterController());
    return Obx(
      () {
        return NonGlassMorphismCard(
          boxHeight: 590.h,
          borderColor: TextColors.textColor1,
          horizontalPadding: 20.w,
          isCenter: true,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              CustomField(
                hintText: "Name",
                controller: registerController.nameController,
              ),
              SizedBox(height: 20.h),
              CustomField(
                hintText: "Email",
                controller: registerController.emailController,
              ),
              SizedBox(height: 20.h),
              CustomField(
                hintText: "Phone Number",
                controller: registerController.mobileController,
              ),
              SizedBox(height: 20.h),
              CustomField(
                hintText: "Refer",
                controller: registerController.referCodeController,
              ),
              SizedBox(height: 20.h),
              const CountrySelector(),
              SizedBox(height: 20.h),
              CustomField(
                hintText: "Password",
                controller: registerController.passwordController,
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              CustomField(
                hintText: "Confirm Password",
                controller: TextEditingController(),
                isPassword: true,
              ),
              SizedBox(height: 30.h),
              registerController.registerLoading.value
                  ? const ButtonLoading()
                  : CustomButton(
                      onPressed: () async {
                        await registerController.getUserRegister();
                      },
                      buttonText: "Sign Up",
                    )
            ],
          ),
        );
      },
    );
  }

  Widget loginText() {
    return GestureDetector(
      onTap: () {
        Get.to(
          const LoginPage(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextStyles.customText(
            title: "Already have an account? ",
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
          TextStyles.customText(
            title: "Log in",
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: TextColors.textColor2,
          ),
        ],
      ),
    );
  }
}
