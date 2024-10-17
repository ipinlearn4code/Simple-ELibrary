import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:projek/features/news/presentation/data/models/book_data_models.dart';

// Function to load and parse the JSON
Future<List<BookDataModels>> loadBooksData() async {
  // Load JSON from the assets folder
  final jsonData = await rootBundle.rootBundle.loadString('assets/books.json');
  
  // Decode the JSON
  final List<dynamic> decodedData = json.decode(jsonData);
  
  // Map the decoded JSON to a list of BookDataModels
  return decodedData.map((json) => BookDataModels.fromJson(json)).toList();
}
