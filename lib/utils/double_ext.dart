extension DoubleExtNew on double {
  /// k、m、b大数据简写
  String get kmbString {
    if (this > 1e9) {
      return '${(this / 1e9).toStringAsFixed(1)}B';
    } else if (this > 1e6) {
      return '${(this / 1e6).toStringAsFixed(1)}M';
    } else if (this > 1e3) {
      return '${(this / 1e3).toStringAsFixed(1)}K';
    } else if (this > 10) {
      return toStringAsFixed(2);
    } else if (this > 1) {
      return toStringAsFixed(3);
    }
    return toStringAsFixed(4);
  }
}
