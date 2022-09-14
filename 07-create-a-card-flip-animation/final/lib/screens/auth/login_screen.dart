import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';
import 'header_text.dart';
import 'input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          HeaderText(
            headerText: "Login",
            subtitleText: "Please sign in to continue.",
          ),
          SizedBox(height: 64),
          InputField("Email"),
          InputField("Password"),
          SizedBox(height: 16),
          PrimaryButton(name: "login"),
        ],
      ),
    );
  }
}
