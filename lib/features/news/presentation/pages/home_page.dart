import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/carousel.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/news_list.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/search_field.dart';
import 'package:projek/features/news/presentation/widgets/bottom_nav_bar.dart';
import 'package:projek/features/news/presentation/widgets/tab_nav_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(padding: const EdgeInsets.all(16.0), child: SearchField()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ipin E-Lib',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Carousel(),
            TabNavCategory(
              onTabSelected: (tabNavIndex) {
                setState(() {
                  this.tabNavIndex = tabNavIndex;
                  // log('Index category : $tabNavIndex');
                });
              },
            ),
            NewsList(
              data: [],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
