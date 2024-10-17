import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:projek/features/eLib/presentation/data/models/book_data_models.dart';

class BookReadPage extends StatefulWidget {
  final BookDataModels book;

  const BookReadPage({Key? key, required this.book}) : super(key: key);

  @override
  _BookReadPageState createState() => _BookReadPageState();
}

class _BookReadPageState extends State<BookReadPage> {
  String? localPdfPath;

  @override
  void initState() {
    super.initState();
    if (widget.book.pdfLink != null) {
      _loadPdfFromAssets(widget.book.pdfLink!);
    }
  }

  Future<void> _loadPdfFromAssets(String path) async {
    final data = await rootBundle.load(path);
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/temp.pdf');
    final localFile =
        await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    setState(() {
      localPdfPath = localFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: localPdfPath != null
          ? PDFView(
              filePath: localPdfPath,
              onPageChanged: (int? page, int? total) {
                log('Page : $page of $total');
                // You can track the page number here and perform any actions, like saving progress
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
