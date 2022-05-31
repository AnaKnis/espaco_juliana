import 'package:espaco_juliana/src/common/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:espaco_juliana/src/common/custom_drawer/custom_drawer.dart';
import 'package:espaco_juliana/src/models/client/page_manager.dart';
import 'package:espaco_juliana/src/screens/home/widgets/build_app_bar.dart';
import 'package:espaco_juliana/src/screens/home/widgets/build_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Container(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: buildAppBar(),
            ),
            body: buildBody(),
            drawer: CustomDrawer(),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}
