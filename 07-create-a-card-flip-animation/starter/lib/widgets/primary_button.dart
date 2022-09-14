import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    Key? key,
    required this.name,
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.only(top: 32),
        // margin: EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Colors.green[900],
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          name.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
