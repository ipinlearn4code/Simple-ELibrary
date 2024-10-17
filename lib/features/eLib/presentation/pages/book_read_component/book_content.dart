import 'package:flutter/material.dart';
import 'package:projek/features/eLib/presentation/data/models/book_data_models.dart';
import 'package:url_launcher/url_launcher.dart';

class BookContent extends StatelessWidget {
  final BookDataModels book;

  BookContent({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // Automatically attempt to open PDF link if available
    if (book.pdfLink != null) {
      _openPdf(context, book.pdfLink!);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: book.pdfLink == null
          ? const DummyBooks() // Display dummy content if no PDF link
          : Container(), // If PDF is available, no need to display extra content
    );
  }

  Future<void> _openPdf(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Launch PDF link
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the PDF')),
      );
    }
  }
}

class DummyBooks extends StatelessWidget {
  const DummyBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Ceritanya masih dummy jadi saya pakai Lorem ipsum dolor sit amet...',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}
