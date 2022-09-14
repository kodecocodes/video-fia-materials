import 'package:flutter/material.dart';
import '../../models/offer.dart';

class OffsersSlider extends StatefulWidget {
  @override
  State<OffsersSlider> createState() => _OffsersSliderState();
}

class _OffsersSliderState extends State<OffsersSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: PageView.builder(
            itemCount: offers.length,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (context, index) {
              final offer = offers[index];
              return Item(offer: offer);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < offers.length; i++)
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
                    const Text(
                      "OFFER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
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
    return Container(
      height: 6,
      width: isActive ? 22 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.black26,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
