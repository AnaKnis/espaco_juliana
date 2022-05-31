import 'package:espaco_juliana/src/models/client/client_manager.dart';
import 'package:espaco_juliana/src/screens/home/home_page.dart';
import 'package:espaco_juliana/src/screens/login/login_screen.dart';
import 'package:espaco_juliana/src/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClientManager(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter",
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.red
        ),
        initialRoute: "/home_page",
        onGenerateRoute: (settings){
          switch (settings.name){
            case "/login":
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case "/signup":
              return MaterialPageRoute(
                builder: (_) => SignUpScreen(),
              );
            case "/home_page":
            default:
              return MaterialPageRoute(builder: (_) => HomePage());
          }
        },
      ),
    );
  }
}