import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interview/controller/search_controller.dart' as search;
import 'package:interview/pages/search_result_page.dart';

/// 币对搜索页
class SymbolSearchPage extends StatefulWidget {
  const SymbolSearchPage({
    super.key,
    this.keyword,
  });

  final String? keyword;

  @override
  _SymbolSearchPageState createState() => _SymbolSearchPageState();
}

class _SymbolSearchPageState extends State<SymbolSearchPage> {
  late search.SearchController searchController;

  @override
  void initState() {
    super.initState();

    searchController = Get.put(search.SearchController());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.keyword != null) {
      searchController.onSearch(widget.keyword!);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 4.w),
            child: Icon(
              Icons.search,
              color: const Color(0xFF293F52),
              size: 16.w,
            ),
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: 'Enter Symbol Name',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 12.sp, color: const Color(0xFFA7B4BF)),
            ),
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12.sp, color: const Color(0xFF293F52)),
            controller: TextEditingController(text: widget.keyword),
            onChanged: searchController.onSearch,
          )),
        ]),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 12.sp, color: const Color(0xFF293F52)),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Obx(() => SearchResultPage(list: searchController.resultList.value)),
      ),
    );
  }
}
