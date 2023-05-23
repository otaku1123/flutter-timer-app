import 'dart:async';

class TimerState {
  Timer? timer;
  int currentTime = 0;

  TimerState({
    this.timer,
    this.currentTime = 0,
  });

  TimerState copyWith({Timer? timer, int? time}) {
    return TimerState(
      timer: timer,
      currentTime: time ?? this.currentTime,
    );
  }
}
