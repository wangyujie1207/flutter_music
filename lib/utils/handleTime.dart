//计算时间
String calculateTime(num time) {
  String minutes;
  String seconds;
  String text;
  if (time <= 0) {
    text = '00:00';
  } else {
    if (time ~/ 60 < 10) {
      minutes = '0' + (time ~/ 60).toString();
    } else {
      minutes = (time ~/ 60).toString();
    }
    if (time % 60 < 10) {
      seconds = '0' + (time % 60).toString();
    } else {
      seconds = (time % 60).toString();
    }
    text = minutes + ':' + seconds;
  }
  return text;
}
