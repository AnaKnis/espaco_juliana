import 'package:espaco_juliana/src/screens/home/widgets/categories.dart';
import 'package:espaco_juliana/src/screens/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../models/products/product.dart';

class buildBody extends StatefulWidget {
  @override
  State<buildBody> createState() => _buildBodyState();
}

class _buildBodyState extends State<buildBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Categories(),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                product: products[index],
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
