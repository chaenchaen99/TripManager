String formatTime(int seconds) {
  int minutes = seconds ~/ 60; // 분을 계산합니다.
  int remainingSeconds = seconds % 60; // 나머지 초를 계산합니다.

  // 분과 초를 두 자릿수로 포맷합니다.
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}
