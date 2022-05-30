import 'package:flutter/material.dart';

class Product {
  final String? image, title, description;
  final int? price, size, id;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Oil Wella",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/cabelos1.png",
  ),
  Product(
      id: 2,
      title: "Color Recharge Wella",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/cabelos2.png",
      ),
  Product(
      id: 3,
      title: "Kit Fusion Wella",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/cabelos3.png",
      ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";