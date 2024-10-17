class BookDataModels {
  final String title;
  final String author;
  final String image;
  final String description;
  final String category;
  final String? pdfLink;

  BookDataModels({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.category,
    this.pdfLink,
  });

  factory BookDataModels.fromJson(Map<String, dynamic> json) {
    return BookDataModels(
      title: json['title'],
      author: json['author'],
      image: json['image'],
      description: json['description'],
      category: json['category'],
      pdfLink: json['pdfLink'],
    );
  }
}
