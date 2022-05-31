import 'package:espaco_juliana/src/models/products/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final Product? product;
  final Function? press;

  const ProductCard({Key? key, this.product, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: press!(),
                child: Container(
                    height: 320,
                    width: 200,
                  ),
              ),
              Container(
                height: 220,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Positioned(
                bottom: 70,
                child: Image.asset(product!.image ?? "",
                    width: 250, height: 250),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  //color: selectedIndex == index ? AppColors.black : Colors.grey
                  icon: Icon(
                      Icons.favorite, color: Colors.red[400]),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 280,
                child: Text(
                  product!.title ?? "",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
