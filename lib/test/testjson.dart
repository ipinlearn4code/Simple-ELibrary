import 'package:flutter/material.dart';
import 'package:projek/core/services/data_service.dart';
import 'package:projek/features/eLib/presentation/data/models/book_data_models.dart';

class Testjson extends StatefulWidget {
  const Testjson({super.key});

  @override
  State<Testjson> createState() => _TestjsonState();
}

class _TestjsonState extends State<Testjson> {
  late Future<List<BookDataModels>> _booksData;

  @override
  void initState() {
    super.initState();
    _booksData = loadBooksData(); // Load data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: FutureBuilder<List<BookDataModels>>(
        future: _booksData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: Image.asset(book.image, width: 50),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                );
              },
            );
          } else {
            return Center(child: Text('No Data Available'));
          }
        },
      ),
    );
  }
}
