import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  //int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: (Icon(Icons.home)),
            label: "Início"
          ),
          BottomNavigationBarItem(
              icon: (Icon(Icons.favorite_outline)),
              label: "Favoritos"
          ),
          BottomNavigationBarItem(
              icon: (Icon(Icons.person)),
              label: "Sua Conta"
          ),
        ]);
  }
}
