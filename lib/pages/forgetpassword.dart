import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: context.pop, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(children: [
        Center(
          child: Text(
            'Forgot Password',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Enter your email address to reset your password',
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OtpTextField(
          numberOfFields: 5,
          borderColor: Color(0xFF512DA8),
          //set to true to show as box or false to show as dash
          showFieldAsBox: false,
          keyboardType: TextInputType.number,
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
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text("ok"))
                    ],
                  );
                });
          }, // end onSubmit
        ),
      ]),
    );
  }
}
