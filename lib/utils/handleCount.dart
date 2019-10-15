//计算数量
String calculateCount(num count) {
  int countTotal = count.round();
  String countString = countTotal.toString();
  int length = countString.length;
  if (countTotal >= 100000000) {
    return countString.substring(0, length - 8) + '亿';
  } else if (countTotal >= 10000) {
    return countString.substring(0, length - 4) + '万';
  } else {
    return countString;
  }
}
