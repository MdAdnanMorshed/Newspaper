import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/bookmarkslist/bindings/bookmarkslist_binding.dart';
import '../modules/bookmarkslist/views/bookmarkslist_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/news_details/bindings/news_details_binding.dart';
import '../modules/news_details/views/news_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => const NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARKSLIST,
      page: () => const BookmarksListView(),
      binding: BookmarkslistBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
  ];
}
