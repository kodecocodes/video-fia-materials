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
import '../../models/offer.dart';

class OffsersSlider extends StatefulWidget {
  const OffsersSlider({Key? key}) : super(key: key);

  @override
  State<OffsersSlider> createState() => _OffsersSliderState();
}

class _OffsersSliderState extends State<OffsersSlider> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
        // Update Note: Used const keyword with
        // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)         
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: PageView.builder(
            itemCount: offers.length,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final offer = offers[index];
              // Update Note: Removed leading underscores for the local
              // variable to follow good practise. For more info,
              // [no_leading_underscores_for_local_identifiers](https://dart-lang.github.io/linter/lints/no_leading_underscores_for_local_identifiers.html)
              final scale = _selectedIndex == index ? 1.0 : 0.8;
              // Update Note: Explicitly mentionedthe value type passed in the
              // builder parameter otherwise dart assumes the value variable as
              // generic datatype
              return TweenAnimationBuilder<double>(
                // Update Note: Used const keyword with
                // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
                duration: const Duration(milliseconds: 350),
                curve: Curves.ease,
                tween: Tween(begin: scale, end: scale),
                child: Item(offer: offer),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Update Note: Used const keyword with
            // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
            for (int i = 0; i < offers.length; i++)
              if (i == _selectedIndex)
                const Indicator(isActive: true)
              else
                const Indicator(isActive: false),
          ],
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(offer.imgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  // Update Note: Used of single quotes 
                  // than double quotes. Ref: [prefer_single_quotes](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html)
                    const Text(
                      'OFFER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Update Note: Replaced Container with SizedbBox. As from
                    // perfomance perspective SizedBox is better choice for
                    // whitespaces. Ref: [sized_box_for_whitespace](https://dart-lang.github.io/linter/lints/sized_box_for_whitespace.html)
                    SizedBox(
                      width: 200,
                      child: Text(
                        offer.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      offer.restaurantName.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      height: 6,
      width: isActive ? 22 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color:
            isActive ? Theme.of(context).colorScheme.secondary : Colors.black26,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}