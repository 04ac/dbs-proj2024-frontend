// class Book {
//   final String title;
//   final String author;
//   final double rating;
//   final String imgUrl;
//   final String numRatingsStr;
//   final String yearPubStr;
//
//   Book({
//     required this.title,
//     required this.author,
//     required this.rating,
//     required this.numRatingsStr,
//     required this.yearPubStr,
//     required this.imgUrl,
//   });
// }

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

// class Book {
//   int bookId;
//   String title;
//   String description;
//   DateTime datePublished;
//   double rating;
//   int ratingCount;
//   String categories; // Changed to single string
//   String forAges;
//   List<String> authors;
//   String imageUrl;
//
//   Book({
//     required this.bookId,
//     required this.title,
//     required this.description,
//     required this.datePublished,
//     required this.rating,
//     required this.ratingCount,
//     required this.categories,
//     required this.forAges,
//     required this.authors,
//     required this.imageUrl,
//   });
//
//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       bookId: json['book_id'],
//       title: json['title'],
//       description: json['Description'],
//       datePublished: DateTime.parse(json['date_published']),
//       rating: json['rating'],
//       ratingCount: json['rating_count'],
//       categories: json['categories'],
//       forAges: json['for_ages'],
//       authors: List<String>.from(jsonDecode(json['authors'])),
//       imageUrl: json['image_url'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'book_id': bookId,
//         'title': title,
//         'Description': description,
//         'date_published': datePublished.toIso8601String(),
//         'rating': rating,
//         'rating_count': ratingCount,
//         'categories': categories,
//         'for_ages': forAges,
//         'authors': jsonEncode(authors),
//         'image_url': imageUrl,
//       };
// }
