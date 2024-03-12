import 'package:realm/realm.dart';

class MyBook {
  final ObjectId id;
  String title;
  String? kind;
  String? author;
  String? description;

  MyBook(
      {required this.id,
      required this.title,
      this.kind,
      this.author,
      this.description});
}
