import 'package:flutter/material.dart';
import 'package:flutter_tp3_navigation/views/home/carousel.dart';
import 'package:flutter_tp3_navigation/widgets/itemHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Carousel(),
      Expanded(
        child: ListView(
          children: [ItemHome(), ItemHome(), ItemHome(), ItemHome()],
        ),
      )
    ]);
  }
}
