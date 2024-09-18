import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const tradeTypeAll = 'All';
const tradeTypeSpot = 'SPOT';
const tradeTypeFeatures = 'FUTURES';

// styles
TextStyle searchTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, color: const Color(0xFFA7B4BF));
TextStyle sortTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF7A91A0));

enum TradeType { all, contract, spot }

/// 排序条件
enum SortCondition {
  none,

  /// 按名称升序
  nameAsc,

  /// 按名称降序
  nameDesc,

  /// 价格升序
  priceAsc,

  /// 价格降序
  priceDesc,

  /// 24小时成交额升序
  volume24hAsc,

  /// 24小时成交额降序
  volume24hDesc,
}

const String data = '''
    [{
		"base": "BTC",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 43899.92,
		"volume": 246944876.72997272
	},
	{
		"base": "ETH",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 3132.67,
		"volume": 177111682.0831828
	},
	{
		"base": "DODO",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 0.601,
		"volume": 2406.8213148
	},
	{
		"base": "USDC",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 0.9993,
		"volume": 146155.347837
	},
	{
		"base": "SHIB",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 0.00003288,
		"volume": 5848644.59795569
	},
	{
		"base": "DOGE",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 0.164544,
		"volume": 8114501.025757
	},
	{
		"base": "NEAR",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 13.501,
		"volume": 1448972.921938
	},
	{
		"base": "OKB",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 22.973,
		"volume": 5128.2330661
	},
	{
		"base": "WOO",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 0.80146,
		"volume": 6099463.5366493
	},
	{
		"base": "XRP",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 0.8633,
		"volume": 10964532.135953
	},
	{
		"base": "DYDX",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 8.179,
		"volume": 366540.0043351
	},
	{
		"base": "AURORA",
		"quote": "USDT",
		"type": "SPOT",
		"lastPrice": 14.213,
		"volume": 4436.1874587
	},
	{
		"base": "ATOM",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 31.832,
		"volume": 3038527.85901
	},
	{
		"base": "LINK",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 18.825,
		"volume": 3268539.039502
	},
	{
		"base": "SUSHI",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 4.8646,
		"volume": 774147.137607
	},
	{
		"base": "QRDO",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 3.67602,
		"volume": 107119.72425381
	},
	{
		"base": "BSV",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 102.78,
		"volume": 129837.32864
	},
	{
		"base": "BTC",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 44409.92,
		"volume": 67823641.0
	},
	{
		"base": "ETH",
		"quote": "USDT",
		"type": "FUTURES",
		"lastPrice": 3333.00,
		"volume": 67823642.0
	}
]
''';
