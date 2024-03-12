import 'package:databook/%08storage/models.dart';
import 'package:databook/%08storage/realm_manager.dart';
import 'package:databook/book.dart';
import 'package:databook/button.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class ChiTiet extends StatefulWidget {
  final MyBook book;

  ChiTiet({required this.book});

  @override
  State<ChiTiet> createState() => _ChiTietState();
}

class _ChiTietState extends State<ChiTiet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Author: ${widget.book.kind}',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Text('Genre: ${widget.book.author}',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Text('dicription: ${widget.book.description}',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(
            height: 500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                middleWidget: const Text(
                  'edit',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: () {},
                width: 150,
                height: 50,
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
              Button(
                middleWidget: const Text(
                  'delete',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: () {
                  RealmManger.shared.deleteBook(widget.book.id);
                  Navigator.maybePop(context);
                },
                width: 150,
                height: 50,
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
