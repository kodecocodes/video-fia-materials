import 'package:flutter/material.dart';
import '../../models/extra.dart';

class ExtraItem extends StatefulWidget {
  final Extra extra;

  const ExtraItem({Key? key, required this.extra}) : super(key: key);

  @override
  State<ExtraItem> createState() => _ExtraItemState();
}

class _ExtraItemState extends State<ExtraItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Image.asset(
              widget.extra.imgUrl,
              width: 70,
              height: 70,
            ),
          ),
          Text(
            widget.extra.name,
          ),
        ],
      ),
    );
  }
}
