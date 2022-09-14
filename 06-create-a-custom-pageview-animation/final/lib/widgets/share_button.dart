import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isOpen = false;

  _toggleShare() {
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
              shape: const StadiumBorder(),
            ),
          ),
          Container(
            width: 40,
            margin: const EdgeInsets.only(left: 4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 450),
              firstChild: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () => _toggleShare(),
              ),
              secondChild: IconButton(
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
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon-facebook.png"),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon-twitter.png"),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage("assets/images/icon-instagram.png"),
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
