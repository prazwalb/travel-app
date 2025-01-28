import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpTextField(
        numberOfFields: 5,
        borderColor: const Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              });
        }, // end onSubmit
      ),
    );
  }
}
