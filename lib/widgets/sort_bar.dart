import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/contants/trade_contants.dart';
import 'package:interview/widgets/sort_button.dart';

/// 排序栏
class SortBar extends StatelessWidget {
  const SortBar({
    super.key,
    this.condition = SortCondition.none,
    this.tradeType = TradeType.contract,
    this.onSortTap,
    required this.onConditionChange,
  });

  /// 交易类型
  final TradeType tradeType;

  /// 排序条件
  final SortCondition condition;

  /// 排序条件改变回调
  final ValueChanged<SortCondition> onConditionChange;

  /// 点击排序回调
  final ValueChanged? onSortTap;

  /// 恢复到默认排序
  SortCondition restoreToDefaultCondition() => SortCondition.none;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: SortButton(
            onConditionChange: onConditionChange,
            selectCondition: condition,
            ascCondition: SortCondition.nameAsc,
            descCondition: SortCondition.nameDesc,
            mainAxisAlignment: MainAxisAlignment.start,
            title: 'Symbol',
            tradeType: tradeType,
            restoreToDefaultCondition: restoreToDefaultCondition,
          )),
          Expanded(
            child: SortButton(
              onConditionChange: onConditionChange,
              selectCondition: condition,
              ascCondition: SortCondition.priceAsc,
              descCondition: SortCondition.priceDesc,
              title: 'Last Price',
              tradeType: tradeType,
              titleStyle: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFFA7B4BF)),
              restoreToDefaultCondition: restoreToDefaultCondition,
            ),
          ),
          Expanded(
            child: SortButton(
              onConditionChange: onConditionChange,
              selectCondition: condition,
              ascCondition: SortCondition.volume24hAsc,
              descCondition: SortCondition.volume24hDesc,
              title: 'Volume',
              flexible: true,
              tradeType: tradeType,
              titleStyle: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFFA7B4BF)),
              restoreToDefaultCondition: restoreToDefaultCondition,
            ),
          )
        ],
      ),
    );
  }
}
