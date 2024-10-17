import 'package:flutter/material.dart';
import 'package:projek/features/eLib/presentation/pages/book_read_page.dart';
import 'package:projek/features/eLib/presentation/pages/home_page_component/book_list_card.dart';
import 'package:projek/features/eLib/presentation/data/models/book_data_models.dart';

class BookList extends StatelessWidget {
  final List<BookDataModels> books;

  const BookList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          key: Key(book.title), // Add a unique key
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookReadPage(
                  book: book,
                ),
              ),
            );
          },
          child: BookListCard(
            title: book.title,
            img: Image.asset(book.image),
            description: book.description,
          ),
        );
      },
    );
  }
}
