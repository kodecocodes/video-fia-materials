// ignore_for_file: lines_longer_than_80_chars
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

class Meal {
  final String name;
  final String description;
  final double price;
  final String imgUrl;

  Meal({
    required this.name,
    required this.description,
    required this.price,
    required this.imgUrl,
  });
}

List<Meal> topMeals = [
  Meal(
    name: 'Grilled Pork with Sour Sauce',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/pork-sauce.jpeg',
  ),
  Meal(
    name: 'Tikka Chicken Pizza',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/pizza-1.jpeg',
  ),
  Meal(
    name: 'Chicken Wings Barbecue',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/barbecue.jpeg',
  ),
  Meal(
    name: 'Spaghetti with Sausages',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/spaghetti.jpeg',
  ),
];

List<Meal> favouriteMeals = [
  Meal(
    name: 'Minced Pork with Rice',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/pork-rice.jpg',
  ),
  Meal(
    name: 'Veg Salad with Coconut Juice',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/veg-salad-coconut-juice.jpeg',
  ),
  Meal(
    name: 'Chocolate Cake',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/chocolate-cake.jpeg',
  ),
  Meal(
    name: 'Veg Corrainder Soup',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/veg-soup.jpeg',
  ),
];

List<Meal> continentalMeals = [
  Meal(
    name: 'Egusi Soup with Fufu',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/egusi.jpg',
  ),
  Meal(
    name: 'Arabian Veg Salata',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/arabian-veg-salata.jpeg',
  ),
  Meal(
    name: 'African Salad',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/abacha.jpg',
  ),
  Meal(
    name: 'Caribbean Pork with Sauce',
    description:
        'Deserunt dignissimos voluptatem sed nihil consequatur eum. Rerum odit nulla expedita qui rerum minus. Rerum odit nulla expedita qui rerum minus.',
    price: 17.60,
    imgUrl: 'assets/images/pork-sauce.jpeg',
  ),
];
