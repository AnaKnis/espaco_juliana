import 'package:espaco_juliana/core/app_colors.dart';
import 'package:espaco_juliana/models/client/client_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0, 24.0, 16.0, 8.0),
      height: 180.0,
      child: Consumer<ClientManager>(
        builder: (_, userManager, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Espaço Juliana",
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 30.0),
              Text("Olá, ${userManager.client?.name ?? " "}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              GestureDetector(
                onTap: () {
                  if(userManager.isLoggedIn){
                    userManager.signOut();
                  } else {
                    Navigator.of(context).pushNamed("/login");
                  }
                },
                child: Text(userManager.isLoggedIn
                    ? "Sair"
                    : "Entre ou cadastre-se >",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}