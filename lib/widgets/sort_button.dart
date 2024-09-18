import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/contants/trade_contants.dart';

/// 恢复到默认排序
typedef RestoreToDefaultCondition = SortCondition Function();

/// 排序按钮
class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
    required this.title,
    required this.selectCondition,
    required this.ascCondition,
    required this.descCondition,
    required this.onConditionChange,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.padding = EdgeInsets.zero,
    this.onSortTap,
    this.flexible = false,
    this.tradeType = TradeType.contract,
    this.restoreToDefaultCondition,
    this.titleStyle,
  });

  /// 标题
  final String title;

  /// 当前选择的排序条件
  final SortCondition selectCondition;

  /// 升序条件
  final SortCondition ascCondition;

  /// 降序条件
  final SortCondition descCondition;

  /// 条件改变回调
  final ValueChanged<SortCondition> onConditionChange;

  /// 对齐
  final MainAxisAlignment mainAxisAlignment;

  /// 内边距
  final EdgeInsets padding;

  /// 点击排序回调
  final Function? onSortTap;

  /// 是否弹性，默认否
  final bool flexible;

  /// 交易类型
  final TradeType tradeType;

  //标题style
  final TextStyle? titleStyle;

  /// 恢复到默认条件的回调
  final RestoreToDefaultCondition? restoreToDefaultCondition;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 改变排序条件，升序(asc) -> 降序(desc) -> 无(none)
        if (selectCondition == descCondition) {
          onConditionChange(restoreToDefaultCondition?.call() ?? SortCondition.none);
        } else if (selectCondition == ascCondition) {
          onConditionChange(descCondition);
        } else {
          onConditionChange(ascCondition);
        }
        onSortTap?.call();
      },
      child: Container(
        height: 30.h,
        padding: padding,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            if (flexible)
              Flexible(
                child: Text(
                  title,
                  style: titleStyle ?? sortTextStyle,
                  textAlign: TextAlign.end,
                ),
              )
            else
              Text(
                title,
                style: titleStyle ?? sortTextStyle,
              ),
            Container(
              width: 10.w,
              height: 20.h,
              margin: EdgeInsets.only(left: 6.w),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 4.h,
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 8.h,
                      color: selectCondition == ascCondition
                          ? const Color(0xFF0BD4C6)
                          : const Color(0xFFA7B4BF),
                    ),
                  ),
                  Positioned(
                    bottom: 4.h,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 8.w,
                      color: selectCondition == descCondition
                          ? const Color(0xFF0BD4C6)
                          : const Color(0xFFA7B4BF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
