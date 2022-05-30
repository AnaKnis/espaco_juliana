import 'package:espaco_juliana/helpers/validators.dart';
import 'package:espaco_juliana/models/client/client.dart';
import 'package:espaco_juliana/models/client/client_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/signup");
            },
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 14.0),
            ),
            textColor: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Consumer<ClientManager>(
              builder: (_, userManager, __) {
                return ListView(
                  padding: EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if (!emailValid(email!)) {
                          return "E-mail inválido";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(hintText: "Senha"),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass) {
                        if (pass!.isEmpty || pass.length < 6) {
                          return "Senha Inválida";
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: const Text("Esqueci minha senha"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userManager.loading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            //context.read<UserManager>().signIn
                            userManager.signIn(
                              client: Client(
                                  email: emailController.text,
                                  password: passController.text),
                              onFail: (e) {
                                scaffoldKey.currentState!
                                    .showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Falha ao Entrar: $e"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              onSuccess: () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userManager.loading
                            ? CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation(Colors.white),
                        )
                            : Text(
                          'ENTRAR',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}