import 'package:flutter/material.dart';
import 'package:projek/core/services/data_service.dart';
import 'package:projek/features/news/presentation/data/models/book_data_models.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/carousel.dart';
import 'package:projek/features/news/presentation/pages/home_page_component/book_list.dart';
import 'package:projek/features/news/presentation/widgets/bottom_nav_bar.dart';
import 'package:projek/features/news/presentation/widgets/tab_nav_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabNavIndex = 0;
  late Future<List<BookDataModels>> _booksData;

  @override
  void initState() {
    super.initState();
    _booksData = loadBooksData(); // Load data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // const Padding(padding: EdgeInsets.all(16.0), child: SearchField()),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ipin E-Lib',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Carousel(),
            TabNavCategory(
              onTabSelected: (tabNavIndex) {
                setState(() {
                  this.tabNavIndex = tabNavIndex;
                });
              },
            ),
            FutureBuilder<List<BookDataModels>>(
              future: _booksData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return BookList(books: snapshot.data!);
                } else {
                  return const Center(child: Text('No Data Available'));
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
