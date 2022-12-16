class ConvertTime{
  static String millisecondsToDate(int date){
    return '${DateTime.fromMillisecondsSinceEpoch(date).day}-${DateTime.fromMillisecondsSinceEpoch(date).month}-${DateTime.fromMillisecondsSinceEpoch(date).year}';
  }
  static String millisecondsToTime(int time){
    return "${DateTime.fromMillisecondsSinceEpoch(time).hour}:${DateTime.fromMillisecondsSinceEpoch(time).minute}";
  }
}