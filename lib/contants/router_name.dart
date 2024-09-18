import 'package:get/get.dart';
import 'package:interview/pages/home_page.dart';
import 'package:interview/pages/search.dart';

class RouteName {
  static const searchRouter = '/search';

  static final List<GetPage> routeNames = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: searchRouter, page: () => const SymbolSearchPage())
  ];
}
