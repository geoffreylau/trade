import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/models/trade_model.dart';
import 'package:interview/utils/double_ext.dart';
import 'package:interview/widgets/empty.dart';
import 'package:interview/widgets/symbol_name_badge.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, required this.list});

  final List<TradeModel> list;

  @override
  State<StatefulWidget> createState() => _StateTradeList();
}

class _StateTradeList extends State<SearchResultPage> {
  @override
  Widget build(Object context) {
    return Column(
      mainAxisAlignment: widget.list.isEmpty ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment:
          widget.list.isEmpty ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        widget.list.isEmpty
            ? _createEmptyWidget()
            : Expanded(
                child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  TradeModel model = widget.list[index];
                  return Row(
                    children: [
                      Expanded(child: SymbolNameBadge(symbol: model)),
                      Expanded(
                          child: Text('\$${model.lastPrice}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: const Color(0xFF121B24)))),
                      Expanded(
                          child: Text(model.volume?.kmbString ?? '0.0',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: const Color(0xFF121B24))))
                    ],
                  );
                },
                itemCount: widget.list.length,
                itemExtent: 50.h,
              ))
      ],
    );
  }

  Widget _createEmptyWidget() {
    return const EmptyWidget(
      title: 'No Data',
    );
  }
}
