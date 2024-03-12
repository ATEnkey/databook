// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Book extends _Book with RealmEntity, RealmObjectBase, RealmObject {
  Book(
    ObjectId id,
    String title, {
    String? kind,
    String? author,
    String? dicription,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'kind', kind);
    RealmObjectBase.set(this, 'author', author);
    RealmObjectBase.set(this, 'dicription', dicription);
  }

  Book._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get kind => RealmObjectBase.get<String>(this, 'kind') as String?;
  @override
  set kind(String? value) => RealmObjectBase.set(this, 'kind', value);

  @override
  String? get author => RealmObjectBase.get<String>(this, 'author') as String?;
  @override
  set author(String? value) => RealmObjectBase.set(this, 'author', value);

  @override
  String? get dicription =>
      RealmObjectBase.get<String>(this, 'dicription') as String?;
  @override
  set dicription(String? value) =>
      RealmObjectBase.set(this, 'dicription', value);

  @override
  Stream<RealmObjectChanges<Book>> get changes =>
      RealmObjectBase.getChanges<Book>(this);

  @override
  Book freeze() => RealmObjectBase.freezeObject<Book>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Book._);
    return const SchemaObject(ObjectType.realmObject, Book, 'Book', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('kind', RealmPropertyType.string, optional: true),
      SchemaProperty('author', RealmPropertyType.string, optional: true),
      SchemaProperty('dicription', RealmPropertyType.string, optional: true),
    ]);
  }
}
