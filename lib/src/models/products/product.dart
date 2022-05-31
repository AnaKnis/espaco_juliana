import 'package:espaco_juliana/src/core/app_images.dart';

class Product {
  final String? image, title;
  final int? id;
  final double? price;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Oil Wella",
      price: 175.0,
      image: AppImages.cabelos1,
  ),
  Product(
      id: 2,
      title: "Color Recharge Wella",
      price: 188.0,
      image: AppImages.cabelos2,
      ),
  Product(
      id: 3,
      title: "Kit Fusion Wella",
      price: 215.0,
      image: AppImages.cabelos3,
      ),
];