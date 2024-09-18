import 'package:interview/contants/trade_contants.dart';
import 'package:interview/models/trade_model.dart';

/// 交易对排序
class SymbolSorter {
  const SymbolSorter({required this.condition});

  /// 排序条件
  final SortCondition condition;

  List<TradeModel> sort(List<TradeModel> originList) {
    switch (condition) {
      case SortCondition.nameAsc:
        originList.sort((TradeModel a, TradeModel b) => a.base!.compareTo(b.base!));
        break;
      case SortCondition.nameDesc:
        originList.sort((TradeModel a, TradeModel b) => b.base!.compareTo(a.base!));
        break;
      case SortCondition.priceAsc:
        originList.sort((TradeModel a, TradeModel b) => a.lastPrice!.compareTo(b.lastPrice!));
        break;
      case SortCondition.priceDesc:
        originList.sort((TradeModel a, TradeModel b) => b.lastPrice!.compareTo(a.lastPrice!));
        break;
      case SortCondition.volume24hAsc:
        originList.sort((TradeModel a, TradeModel b) => a.volume!.compareTo(b.volume!));
        break;
      case SortCondition.volume24hDesc:
        originList.sort((TradeModel a, TradeModel b) => b.volume!.compareTo(a.volume!));
        break;
      default:
    }
    return originList;
  }
}
