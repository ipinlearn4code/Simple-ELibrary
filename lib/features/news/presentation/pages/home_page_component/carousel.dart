import 'package:flutter/material.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/carousel_card.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 250, // Set the height for the carousel
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Scroll horizontally
        child: Row(
          children: [
            // First Card
            CarouselCard(),
            SizedBox(width: 16),
            CarouselCard(),
            SizedBox(width: 16),
            CarouselCard(),
            SizedBox(width: 16),
            CarouselCard(),
          ],
        ),
      ),
    );
  }
}
