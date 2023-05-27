import 'package:get/get.dart';

import '../controllers/bookmarkslist_controller.dart';

class BookmarkslistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarksListController>(
      () => BookmarksListController(),
    );
  }
}
