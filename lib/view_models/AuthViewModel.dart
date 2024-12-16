import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tp3_navigation/services/auth_service.dart';
import 'package:flutter_tp3_navigation/views/home/homePage.dart';

class Authviewmodel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Sign-up successful! welcome , ${userCredential.user?.email}')),
      );
//    Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign-up failed :$e")),
      );
    }
  }

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      final user = await _authService.loginWithEmail(email, password);
      notifyListeners(); // Notifie les widgets que l'état a changé
      return user != null;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      notifyListeners();
      return false;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authService.logout();
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vous avez été déconnecté avec succès.")),
      );
    } catch (e) {
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de la déconnexion : $e")),
      );
    }
  }

  void clearError() {
    notifyListeners();
  }
}
