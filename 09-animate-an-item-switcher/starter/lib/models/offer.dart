class Offer {
  final String name;
  final String restaurantName;
  final String imgUrl;

  Offer({
    required this.name,
    required this.restaurantName,
    required this.imgUrl,
  });
}

List<Offer> offers = [
  Offer(
      name: "50% OFF Picnics",
      restaurantName: "All Seasons Hotels",
      imgUrl: "assets/images/offer-1.jpeg"),
  Offer(
    name: "30% OFF Barbecue",
    restaurantName: "Grills Palace",
    imgUrl: "assets/images/offer-4.jpg",
  ),
  Offer(
    name: "Thanksgiving Special",
    restaurantName: "Pick n Eat",
    imgUrl: "assets/images/offer-2.jpeg",
  ),
  Offer(
    name: "50% Off Breakfast",
    restaurantName: "Zinny's Place",
    imgUrl: "assets/images/offer-3.jpeg",
  ),
];
