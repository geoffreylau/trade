import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interview/contants/trade_contants.dart';
import 'package:interview/controller/trade_controller.dart';
import 'package:interview/models/trade_model.dart';
import 'package:interview/utils/double_ext.dart';
import 'package:interview/utils/symbol_sorter.dart';
import 'package:interview/widgets/empty.dart';
import 'package:interview/widgets/sort_bar.dart';
import 'package:interview/widgets/symbol_name_badge.dart';

class TradeListPage extends StatefulWidget {
  const TradeListPage(
      {super.key,
      required this.list,
      this.tradeType = TradeType.all,
      this.condition = SortCondition.none});

  final List<TradeModel> list;
  final TradeType tradeType;
  final SortCondition condition;

  @override
  State<StatefulWidget> createState() => _StateTradeList();
}

class _StateTradeList extends State<TradeListPage> {
  late TradeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<TradeController>();
    controller.sortList.value = widget.list;
    controller.condition = widget.condition;
  }

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
                child: Obx(() => ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SortBar(
                            tradeType: widget.tradeType,
                            condition: controller.condition,
                            onConditionChange: onConditionChange,
                          );
                        }

                        TradeModel model = controller.sortList[index - 1];
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
                      itemCount: controller.sortList.length + 1,
                      itemExtent: 50.h,
                    )))
      ],
    );
  }

  void onConditionChange(SortCondition condition) {
    controller.condition = condition;
    controller.sortList.value = SymbolSorter(condition: condition).sort(widget.list);
  }

  Widget _createEmptyWidget() {
    return const EmptyWidget(
      title: 'No Data',
    );
  }
}
