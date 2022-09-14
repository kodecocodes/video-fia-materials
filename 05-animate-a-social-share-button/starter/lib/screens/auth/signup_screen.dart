import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';

import 'header_text.dart';
import 'input_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      constraints: const BoxConstraints(minHeight: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          HeaderText(headerText: "Create Account"),
          SizedBox(height: 64),
          InputField("Full Name"),
          InputField("Email"),
          InputField("Password"),
          InputField("Confirm Password"),
          SizedBox(height: 16),
          PrimaryButton(name: "sign up"),
        ],
      ),
    );
  }
}
