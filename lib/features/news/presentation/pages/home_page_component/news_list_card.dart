import 'package:flutter/material.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({
    required this.index,
    this.img,
    super.key,
  });
  final int index;
  final Image? img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 8, horizontal: 16), // Add margin for spacing between items
      height: 150, // Height for each news item
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: img != null
                    ? img!.image
                    : NetworkImage('https://via.placeholder.com/400'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          // Title and description on top of the image
          Positioned(
            bottom: 0, // Align at the bottom
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent, // Start with transparent
                    Colors.black54, // End with grey
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter, // Set direction for gradient
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Judul berita ke $index',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Berita ke $index memiliki deskripsi singkat',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
