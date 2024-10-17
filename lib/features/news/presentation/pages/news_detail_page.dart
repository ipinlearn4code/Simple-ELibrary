import 'package:flutter/material.dart';
import 'package:projek/features/news/presentation/pages/detail_page_component/circle_back_button.dart';
import 'package:projek/features/news/presentation/pages/detail_page_component/container_news_image.dart';
import 'package:projek/features/news/presentation/pages/detail_page_component/like_button.dart';
import 'package:projek/features/news/presentation/pages/detail_page_component/news_content.dart';

// ignore: must_be_immutable
class NewsDetailPage extends StatelessWidget {
  NewsDetailPage({Key? key, required this.title, this.img}) : super(key: key);
  String title;
  Image? img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // News disini
                ContainerNewsImage(
                  img: img,
                ),
                SizedBox(height: 50),
                NewsContent(),
              ],
            ),
            // Overlay Back Button
            Positioned(
              top: 32,
              left: 16,
              child: CircleBackButton(),
            ),
            // Overlay News Title
            Positioned(
              bottom: 570,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black54, // semi-transparent background
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sunday, 9 May 2021',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        title.isEmpty ? 'Judul Beritanya kosong' : title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Published by Lorem Ipsum',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: LikeButton(),
    );
  }
}
