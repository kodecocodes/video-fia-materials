import 'package:flutter/material.dart';
import '../../models/extra.dart';

class ExtraItem extends StatefulWidget {
  final Extra extra;
  final ValueChanged<bool> onSelected;
  // final Function(bool) onSelected;

  const ExtraItem({Key key, this.extra, this.onSelected}) : super(key: key);

  @override
  _ExtraItemState createState() => _ExtraItemState();
}

class _ExtraItemState extends State<ExtraItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onSelected(_isSelected);
        });
      },
      child: Container(
        width: 90,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _isSelected
                    ? Border.all(
                        color: colorScheme.secondary,
                        width: 2,
                      )
                    : null,
              ),
              child: Image.asset(
                widget.extra.imgUrl,
                width: 70,
                height: 70,
              ),
            ),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 500),
              style: TextStyle(
                color: Colors.black,
                fontWeight: _isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(
                widget.extra.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
