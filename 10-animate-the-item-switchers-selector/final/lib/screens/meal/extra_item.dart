// Copyright (c) 2022 Razeware LLC

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following
// conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// Notwithstanding the foregoing, you may not use, copy, modify,
// merge, publish, distribute, sublicense, create a derivative work,
// and/or sell copies of the Software in any work that is designed,
// intended, or marketed for pedagogical or instructional purposes
// related to programming, coding, application development, or
// information technology. Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing,
// creation of derivative works, or sale is expressly withheld.

// This project and source code may use libraries or frameworks
// that are released under various Open-Source licenses. Use of
// those libraries and frameworks are governed by their own
// individual licenses.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import 'package:flutter/material.dart';
import '../../models/extra.dart';

class ExtraItem extends StatefulWidget {
  final Extra extra;
  final ValueChanged<bool> onSelected;
  // final Function(bool) onSelected;

  const ExtraItem({Key? key, required this.extra, required this.onSelected})
      : super(key: key);

  @override
  State<ExtraItem> createState() => _ExtraItemState();
}

class _ExtraItemState extends State<ExtraItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    // Update Note: Removed the type annotation as it is the recommeded way
    // (read for mor info: [omit_local_variable_types](https://dart-lang.github.io/linter/lints/omit_local_variable_types.html))
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
              // Update Note: Used const keyword with
              // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
              duration: const Duration(milliseconds: 500),
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
              // Update Note: Used const keyword with
              // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
              duration: const Duration(milliseconds: 500),
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
