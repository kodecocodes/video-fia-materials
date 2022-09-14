import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String name;
  const InputField(
    this.name, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: name,
          // contentPadding: EdgeInsets.all(20),
          // border: InputBorder.none,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(32),
          // ),
        ),
      ),
    );
  }
}
