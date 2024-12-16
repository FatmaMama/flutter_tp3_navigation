import 'package:flutter/material.dart';
import 'package:flutter_tp3_navigation/view_models/AuthViewModel.dart';
import 'package:flutter_tp3_navigation/views/home/homePage.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pwdConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              _inputField(context),
              _signup(authViewModel),
              Center(
                child: Text("OR"),
              ),
              _googleButton(),
              _login(context)
            ],
          ),
        ),
      ),
    );
  }

  _header() {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Text("Sign Up",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        Text("Create an account")
      ],
    );
  }

  _inputField(context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            hintText: "User Name",
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            hintText: "Email",
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(
          height: 20,
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
          height: 20,
        ),
        TextField(
          controller: _pwdConfirmController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            hintText: "Confirm Password",
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
        ),
      ],
    );
  }

  _signup(authViewModel) {
    return ElevatedButton(
        onPressed: () async {
          final email = _emailController.text.trim();
          final password = _pwdController.text.trim();
          final passwordConfirm = _pwdConfirmController.text.trim();

          if (password != passwordConfirm) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Passwords do not match")));
            return;
          }

          final success = await authViewModel.signUp(context, email, password);
          ;
          if (success) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: StadiumBorder()),
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ));
  }

  _googleButton() {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Colors.purple),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.network(
          //   'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png'),
          Image.asset(
            "assets/chrome.png",
            height: 24.0,
          ),
        ],
      ),
    );
  }

  _login(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account ? "),
        TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.purple),
            ))
      ],
    );
  }
}
