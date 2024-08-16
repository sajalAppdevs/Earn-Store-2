import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      fieldWidth: 55.w,
      borderColor: Colors.white.withOpacity(0.3),
      focusedBorderColor: Colors.white.withOpacity(0.4),
      disabledBorderColor: Colors.white.withOpacity(0.2),
      enabledBorderColor: Colors.white.withOpacity(0.2),
      cursorColor: Colors.white,
      showFieldAsBox: true,
      onCodeChanged: (String code) {
        debugPrint(code);
      },
      onSubmit: (String verificationCode) {
        debugPrint(verificationCode);
      },
    );
  }
}
