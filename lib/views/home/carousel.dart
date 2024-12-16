import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.network(
            "https://www.france-serres.com/blog/wp-content/uploads/infos-citrouilles-halloween.webp"),
        Image.asset('assets/hal.jpg', fit: BoxFit.fill),
        Image.asset('assets/hallo.jpg'),
        Image.asset('assets/ha.jpg'),
      ],
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.easeInOut,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        viewportFraction: 0.8,
      ),
    );
  }
}
