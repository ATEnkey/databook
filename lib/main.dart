import 'dart:async';

import 'package:databook/%08storage/models.dart';
import 'package:databook/%08storage/realm_manager.dart';
import 'package:databook/book.dart';
import 'package:databook/button.dart';
import 'package:databook/listview_chitiet.dart';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<MyBook> books = RealmManger.shared.getAllBooks();

  StreamSubscription? subscription;

  void laySach() {
    setState(() {
      books = RealmManger.shared.getAllBooks();
    });

    // for (var item in books) {
    // print('My book is ${item.title} ${item.kind} ');
    // }
  }

  void saveBook() {
    List<Book> arr = [
      Book(ObjectId(), 'Conan',
          kind: 'trinh tham',
          author: 'ABC',
          dicription: 'conan nhu than chet di den dau co nguoi chet o do'),
      Book(ObjectId(), 'Truyen cuoi',
          kind: 'hai huoc',
          author: 'XYZ',
          dicription: 'truyen cuoi dan gian viet nam'),
      Book(ObjectId(), 'Sach tu nhien', kind: 'kien thuc', author: 'BKG'),
      Book(ObjectId(), 'Truyen ngon tinh',
          kind: 'tinh cam',
          author: 'KJV',
          dicription: 'nhung cau truyen cam dong'),
    ];

    final realm = RealmManger.shared.realm;
    realm.write(() {
      realm.addAll(arr);

      // realm.deleteAll();
    });

    laySach();
  }

  @override
  void initState() {
    super.initState();

    subscription =
        RealmManger.shared.realm.all<Book>().changes.listen((changes) {
      // changes.inserted; // indexes of inserted objects
      // changes.modified; // indexes of modified objects
      // changes.deleted; // indexes of deleted objects
      // changes.newModified; // indexes of modified objects
      // // after deletions and insertions are accounted for
      // changes.moved; // indexes of moved objects
      // changes.results; // the full List of objects

      print('changes');

      if (mounted) {
        laySach();
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(books[index].title),
                    subtitle: Text('Author: ${books[index].author}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChiTiet(book: books[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Button(
              onPressed: () {
                saveBook();
              },
              width: 300,
              height: 60,
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
              middleWidget: const Text(
                'add book',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ]),
        ),
      ),
    );
  }
}
