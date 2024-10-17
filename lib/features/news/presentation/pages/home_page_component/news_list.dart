import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/news_list_card.dart';
import 'package:projek/features/news/presentation/pages/news_detail_page.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, this.data});

  final List? data;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  @override
  Widget build(BuildContext context) {
    Image img = Image.network('https://picsum.photos/400/200');
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5, // Number of news articles
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to the NewsDetailPage
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                  title: 'Judul Berita ke $index',
                  img: img,
                ), // Replace with your actual NewsDetailPage
              ),
            );
          },
          child: NewsListCard(index: index, img: img),
        );
      },
    );
  }
}
