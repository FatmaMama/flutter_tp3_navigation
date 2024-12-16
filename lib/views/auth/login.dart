import 'package:flutter/material.dart';
import 'package:flutter_tp3_navigation/view_models/AuthViewModel.dart';
import 'package:flutter_tp3_navigation/views/auth/sign_up.dart';
import 'package:flutter_tp3_navigation/views/home/homePage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);

    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(24),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _header(),
        _inputField(authViewModel, context),
        _forgetPassword(),
        _signup(context)
      ]),
    ));
  }

  _header() {
    return Column(
      children: [
        Text("Welcome Back !!",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        Text("Enter your credential to login!!")
      ],
    );
  }

  _inputField(authViewModel, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            hintText: "Username",
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: _pwdController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            hintText: "Password",
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              final email = _emailController.text.trim();
              final pwd = _pwdController.text.trim();
              final success = await authViewModel.login(email, pwd, context);
              if (success) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: StadiumBorder()),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }

  _forgetPassword() {
    return TextButton(
        onPressed: () => {},
        child: Text(
          "forget password",
          style: TextStyle(color: Colors.purple),
        ));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account"),
        TextButton(
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()))
                },
            child: Text(
              "Sign up",
              style: TextStyle(color: Colors.purple),
            ))
      ],
    );
  }
}
