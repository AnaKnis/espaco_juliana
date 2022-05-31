import 'package:espaco_juliana/src/helpers/validators.dart';
import 'package:espaco_juliana/src/models/client/client.dart';
import 'package:espaco_juliana/src/models/client/client_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Client client = Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
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
                      decoration: InputDecoration(hintText: "Nome Completo"),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Campo Obrigatório";
                        } else if (name.trim().split(" ").length <= 1) {
                          return "Preencha seu nome completo";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (name) => client.name = name!,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      enabled: !userManager.loading,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Campo Obrigatório";
                        } else if (!emailValid(email)) {
                          return "E-mail inválido";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (email) => client.email = email!,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Senha"),
                      obscureText: true,
                      enabled: !userManager.loading,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return "Campo Obrigatório";
                        } else if (pass.length < 6) {
                          return "Senha muita curta";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) => client.password = pass!,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Repita a senha"),
                      obscureText: true,
                      enabled: !userManager.loading,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return "Campo Obrigatório";
                        } else if (pass.length < 6) {
                          return "Senha muita curta";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) => client.confirmPassword = pass!,
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userManager.loading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (client.password != client.confirmPassword) {
                              scaffoldKey.currentState!.showSnackBar(
                                SnackBar(
                                  content: Text("Senhas não coincidem!"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            //context.read<UserManager>().signUp
                            userManager.signUp(
                                client: client,
                                onSuccess: () {
                                  Navigator.of(context).pop();
                                },
                                onFail: (e) {
                                  scaffoldKey.currentState!.showSnackBar(
                                    SnackBar(
                                      content:
                                      Text("Falha ao Cadastrar: $e"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });
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
                          "Criar Conta",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
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