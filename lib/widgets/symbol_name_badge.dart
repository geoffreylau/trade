import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/contants/trade_contants.dart';
import 'package:interview/models/trade_model.dart';

/// 交易对名字
class SymbolNameBadge extends StatelessWidget {
  const SymbolNameBadge({
    super.key,
    required this.symbol,
  });

  /// 交易对
  final TradeModel symbol;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Row(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: width - 24.w),
              child: Text(
                symbol.type == tradeTypeSpot
                    ? '${symbol.base}/${symbol.quote}'
                    : '${symbol.base}-PREP',
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF121B24)),
                maxLines: 1,
              ),
            ),
          ],
        );
      },
    );
  }
}
