import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isOpen = false;

  // Update Note: It is good practise to always mention the return type of a
  // method. For more info read [always_declare_return_types](https://dart-lang.github.io/linter/lints/always_declare_return_types.html)
  void _toggleShare() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastOutSlowIn,
            width: isOpen ? 240 : 48,
            height: 48,
            decoration: ShapeDecoration(
              color: Colors.grey[400],
              // Update Note: Used const keyword with
              // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
              shape: const StadiumBorder(),
            ),
          ),
          Container(
            width: 40,
            margin: const EdgeInsets.only(left: 4),
            // Update Note: Used const keyword with
            // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 450),
              firstChild: IconButton(
                // Update Note: Used const keyword with
                // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
                icon: const Icon(Icons.share),
                onPressed: () => _toggleShare(),
              ),
              secondChild: IconButton(
                // Update Note: Used const keyword with
                // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
                icon: const Icon(Icons.close),
                onPressed: () => _toggleShare(),
              ),
              crossFadeState: !isOpen
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 450),
            opacity: isOpen ? 1 : 0,
            child: Container(
              width: 240,
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                // Update Note: Used const keyword with
                // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
                  IconButton(
                    icon: const ImageIcon(
                      // Update Note: Used of single quotes 
                      // than double quotes. Ref: [prefer_single_quotes](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html)
                      AssetImage('assets/images/icon-facebook.png'),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage('assets/images/icon-twitter.png'),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage('assets/images/icon-instagram.png'),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}