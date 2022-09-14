import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({
    required this.name,
    required this.icon,
  });
}

List<Category> categories = [
  Category(
    name: "Pizza",
    icon: Icons.local_pizza,
  ),
  Category(
    name: "Cake",
    icon: Icons.cake,
  ),
  Category(
    name: "Fish",
    icon: Icons.set_meal,
  ),
  Category(
    name: "Burger",
    icon: Icons.fastfood,
  ),
  Category(
    name: "Grills",
    icon: Icons.local_fire_department,
  ),
  Category(
    name: "Vegetarian",
    icon: Icons.eco,
  ),
];
