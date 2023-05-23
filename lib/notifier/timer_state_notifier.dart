import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/state/timer_state.dart';

class TimerStateNotifier extends StateNotifier<TimerState> {
  TimerStateNotifier() : super(TimerState());

  @override
  void dispose() {
    state.timer?.cancel();
    super.dispose();
  }

  void start() {
    // タイマー開始中は何もしない
    if (state.timer != null) {
      return;
    }

    // 1s毎に時刻を更新する
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // タイマーがキャンセルされたとき何もしない
      if (state.timer == null) {
        return;
      }

      // 現在時刻を更新する
      int time = state.currentTime + 1;
      state = state.copyWith(timer: timer, time: time);
    });

    state = state.copyWith(timer: timer);
  }

  void stop() {
    state.timer?.cancel();
    state = state.copyWith(timer: null, time: 0);
  }

  void pause() {
    if (state.timer == null) {
      return;
    }

    state.timer?.cancel();
    state = state.copyWith(timer: null);
  }
}

final timerStateProvider =
    StateNotifierProvider<TimerStateNotifier, TimerState>(
        (ref) => TimerStateNotifier());
