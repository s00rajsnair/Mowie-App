String changeRuntimeFormat(String runTime) {
  if (runTime != "N/A") {
    List<String> temp = runTime.split(' ');
    int timeInMinute = int.parse(temp[0]);
    if (timeInMinute > 60) {
      if (timeInMinute % 60 == 0) {
        return "${(timeInMinute ~/ 60)}hr";
      } else {
        return "${(timeInMinute ~/ 60)}hr ${timeInMinute % 60}min";
      }
    } else {
      return runTime;
    }
  }
  return runTime;
}
