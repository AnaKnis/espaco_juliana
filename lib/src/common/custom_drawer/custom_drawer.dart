import 'package:espaco_juliana/src/common/custom_drawer/custom_drawer_header.dart';
import 'package:espaco_juliana/src/common/custom_drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(),
          ListView(
            children: [
              CustomDrawerHeader(),
              Divider(),
              DrawerTile(iconData: Icons.home, title: "Início", page: 0),
              DrawerTile(iconData: Icons.list, title: "Produtos", page: 1),
            ],
          ),
        ],
      ),
    );
  }
}
