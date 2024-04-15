import 'dart:convert';

class Book {
  int? bookId;
  String? title;
  String? description;
  String? datePublished;
  double? rating;
  int? ratingCount;
  String? categories;
  String? forAges;
  List<String>? authors;
  String? imageUrl;

  Book(
      {this.bookId,
      this.title,
      this.description,
      this.datePublished,
      this.rating,
      this.ratingCount,
      this.categories,
      this.forAges,
      this.authors,
      this.imageUrl});

  Book.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    title = json['title'];
    description = json['Description'];
    datePublished = json['date_published'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    categories = json['categories'];
    forAges = json['for_ages'];
    authors = json['authors'].cast<String>();
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this.bookId;
    data['title'] = this.title;
    data['Description'] = this.description;
    data['date_published'] = this.datePublished;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['categories'] = this.categories;
    data['for_ages'] = this.forAges;
    data['authors'] = this.authors;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
