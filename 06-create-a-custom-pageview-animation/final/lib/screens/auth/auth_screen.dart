import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(child: isLogin ? LoginScreen() : SignupScreen()),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: isLogin
                            ? RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: colorScheme.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Sign In',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: colorScheme.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
