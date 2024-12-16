import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tp3_navigation/view_models/AuthViewModel.dart';
import 'package:flutter_tp3_navigation/views/chat/chatPage.dart';
import 'package:flutter_tp3_navigation/views/home/homePage.dart';
import 'package:flutter_tp3_navigation/views/auth/login.dart';
import 'package:flutter_tp3_navigation/views/profile/profilePage.dart';
import 'package:flutter_tp3_navigation/views/search/searchPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Authviewmodel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
          home: LoginPage(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;

  List<Widget> list = [HomePage(), SearchPage(), ChatPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 218, 240, 1),
      appBar: AppBar(
        title: Text("Navigation"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: list[page],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(234, 218, 240, 1),
          onTap: (index) => {
                setState(() {
                  page = index;
                })
              },
          items: [
            CurvedNavigationBarItem(
                child: FaIcon(Icons.home,
                    color: const Color.fromARGB(255, 151, 83, 131)),
                label: "Home"),
            CurvedNavigationBarItem(child: Icon(Icons.search), label: "Search"),
            CurvedNavigationBarItem(child: Icon(Icons.message), label: "Chat"),
            CurvedNavigationBarItem(
                child: Icon(Icons.perm_identity), label: "Profile")
          ]),
    );
  }
}
