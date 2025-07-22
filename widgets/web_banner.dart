import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WebBanner extends StatelessWidget {
  final List<String> bannerImages = [
    "https://via.placeholder.com/800x300?text=Banner+1",
    "https://via.placeholder.com/800x300?text=Banner+2",
    "https://via.placeholder.com/800x300?text=Banner+3",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
      ),
      items: bannerImages.map((imageUrl) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      }).toList(),
    );
  }
}