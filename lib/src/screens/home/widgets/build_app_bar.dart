import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class buildAppBar extends StatelessWidget {
  const buildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text("Espaço Juliana"),
      //centerTitle: true,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
