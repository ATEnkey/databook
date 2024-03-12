import 'package:databook/%08storage/models.dart';
import 'package:databook/book.dart';
import 'package:realm/realm.dart';

class RealmManger {
  static RealmManger shared = RealmManger();

  final Realm realm =
      Realm(Configuration.local([Book.schema], schemaVersion: 1));

  void deleteBook(ObjectId id) {
    final book = realm.find<Book>(id);

    if (book == null) {
      return;
    }

    realm.write(() => realm.delete(book));
  }

  List<MyBook> getAllBooks() {
    RealmResults<Book> books = RealmManger.shared.realm.all<Book>();
    return books
        .map((e) => MyBook(
            id: e.id,
            title: e.title,
            kind: e.kind,
            author: e.author,
            description: e.dicription))
        .toList();
  }
}
