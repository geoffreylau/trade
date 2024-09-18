import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/contants/router_name.dart';
import 'package:interview/contants/trade_contants.dart';
import 'package:interview/controller/trade_controller.dart';
import 'package:interview/pages/trade_list_page.dart';
import 'package:interview/widgets/card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late List<String> _tabTitles;
  final List<Widget> _pageWidgets = [];
  final PageController _pageController = PageController();
  late TradeController _controller;
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabTitles = ['All', 'Spot', 'Features'];

    if (Get.isRegistered<TradeController>()) {
      _controller = Get.find<TradeController>();
    } else {
      _controller = Get.put(TradeController());
    }
    _tabController = TabController(length: _tabTitles.length, vsync: this);

    _pageWidgets.add(TradeListPage(
      list: _controller.tradeList,
      condition: SortCondition.nameAsc,
    ));
    _pageWidgets.add(TradeListPage(
      list: _controller.tradeList.where((element) => element.type == tradeTypeSpot).toList(),
      tradeType: TradeType.spot,
      condition: SortCondition.volume24hDesc,
    ));
    _pageWidgets.add(TradeListPage(
      list: _controller.tradeList.where((element) => element.type == tradeTypeFeatures).toList(),
      condition: SortCondition.volume24hDesc,
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 32.h,
            child: XCard(
              color: const Color(0xFFF0F2F7),
              onTap: () {
                Get.toNamed(RouteName.searchRouter);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Icon(
                    Icons.search,
                    size: 18.w,
                    color: const Color(0xFFA7B4BF),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '搜币',
                    style: searchTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            dividerColor: Colors.transparent,
            tabs: _tabTitles
                .map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.w),
                      child: Text(e),
                    ))
                .toList(),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.only(right: 16.w),
            indicatorWeight: 2.w,
            indicatorColor: const Color(0xFF0BD4C6),
            labelColor: const Color(0xFF121B24),
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color(0xFF121B24)),
            unselectedLabelColor: const Color(0xFF7A91A0),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color(0xFF7A91A0)),
            indicatorPadding: EdgeInsets.only(right: 16.w),
            onTap: ((index) {
              _pageController.jumpToPage(index);
            }),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused) ? null : Colors.transparent;
              },
            ),
          ),
          SizedBox(height: 8.w),
          Expanded(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController.index = index;
                  },
                  children: _pageWidgets))
        ],
      ),
    );
  }
}
