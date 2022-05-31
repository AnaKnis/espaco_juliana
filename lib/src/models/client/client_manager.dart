import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espaco_juliana/src/models/client/client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ClientManager extends ChangeNotifier {
  ClientManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Client? client;

  bool _loading = false;

  bool get loading => _loading;

  bool get isLoggedIn => client != null;

  Future<void> signIn(
      {required Client? client, Function? onFail, Function? onSuccess}) async {
    _loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: client!.email!, password: client.password!);
      await _loadCurrentUser(firebaseUser: result.user);
      onSuccess!();
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
    _loading = false;
  }

  void signOut(){
    auth.signOut();
    client = null;
    notifyListeners();
  }

  Future<void> signUp(
      {Client? client, Function? onFail, Function? onSuccess}) async {
    _loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: client?.email ?? "", password: client?.password ?? "");

      client!.id = result.user!.uid;
      this.client = client;

      await client.saveData();

      onSuccess!();

    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
    _loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    final User? currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser = await
      firestore.collection("users").doc(currentUser.uid).get();
      //user = UserData.fromDocument(docUser) as User;
      client = Client.fromDocument(docUser);
      notifyListeners();
    }
  }
}

String getErrorString(String code) {
  switch (code) {
    case 'weak-password':
      return 'Sua senha é muito fraca.';
    case 'invalid-email':
      return 'Seu e-mail é inválido.';
    case 'email-already-in-use':
      return 'E-mail já está sendo utilizado em outra conta.';
    case 'invalid-credential':
      return 'Seu e-mail é inválido.';
    case 'wrong-password':
      return 'Sua senha está incorreta.';
    case 'user-not-found':
      return 'Não há usuário com este e-mail.';
    case 'user-disabled':
      return 'Este usuário foi desabilitado.';
    case 'too-many-requests':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'operation-not-allowed':
      return 'Operação não permitida.';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}