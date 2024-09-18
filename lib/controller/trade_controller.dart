import 'dart:convert';

import 'package:get/get.dart';
import 'package:interview/contants/trade_contants.dart';
import 'package:interview/models/trade_model.dart';

class TradeController extends GetxController {
  var tradeList = <TradeModel>[].obs;
  // 排序后的数据
  var sortList = <TradeModel>[].obs;
  SortCondition condition = SortCondition.none;

  @override
  void onInit() {
    super.onInit();

    List<dynamic> list = json.decode(data);
    tradeList.value = list.map((e) => TradeModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
