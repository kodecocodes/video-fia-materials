import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String headerText;
  final String subtitleText;

  const HeaderText({Key? key, required this.headerText, this.subtitleText = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        subtitleText != ""
            ? Text(
                subtitleText,
                style: Theme.of(context).textTheme.subtitle1,
              )
            : Container()
      ],
    );
  }
}
