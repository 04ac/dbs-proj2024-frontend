import 'book.dart';

class Customer {
  int id;
  String name;
  String passwd;
  List<Book> wishList = [];

  Customer({required this.id, required this.name, required this.passwd});
}
