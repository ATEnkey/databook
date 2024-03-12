import 'package:realm/realm.dart';

part 'book.g.dart';

@RealmModel()
class _Book {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String? kind;
  late String? author;
  late String? dicription;
}
