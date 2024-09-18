class TradeModel {
  String? base;
  String? quote;
  String? type;
  double? lastPrice;
  double? volume;

  TradeModel({this.base, this.quote, this.type, this.lastPrice, this.volume});

  TradeModel.fromJson(Map<String, dynamic> json) {
    if (json["base"] is String) {
      base = json["base"];
    }
    if (json["quote"] is String) {
      quote = json["quote"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["lastPrice"] is double) {
      lastPrice = json["lastPrice"];
    }
    if (json["volume"] is double) {
      volume = json["volume"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["base"] = base;
    _data["quote"] = quote;
    _data["type"] = type;
    _data["lastPrice"] = lastPrice;
    _data["volume"] = volume;
    return _data;
  }
}
