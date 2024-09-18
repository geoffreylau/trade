import 'package:get/get.dart';
import 'package:interview/controller/trade_controller.dart';
import 'package:interview/models/trade_model.dart';

/// 搜索控制器
class SearchController extends GetxController {
  /// 搜索关键字
  RxString keyword = ''.obs;
  // 数据源
  late List<TradeModel> originList;

  var resultList = <TradeModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    TradeController tradeController = Get.find<TradeController>();
    originList = tradeController.tradeList;
  }

  /// 搜索
  void onSearch(String text) {
    keyword(text);
    resultList.value =
        originList.where((element) => element.base?.contains(text) ?? false).toList();
  }
}
