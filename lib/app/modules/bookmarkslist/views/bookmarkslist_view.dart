import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bookmarkslist_controller.dart';

class BookmarkslistView extends GetView<BookmarkslistController> {
  const BookmarkslistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookmarkslistView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookmarkslistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
