import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/notifier/timer_state_notifier.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Timer Page'),
        ),
        body: TimerWidget(),
      ),
    );
  }
}

class TimerWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int time = ref.watch(timerStateProvider).currentTime;
    final Function startFunc = ref.read(timerStateProvider.notifier).start;
    final Function stopFunc = ref.read(timerStateProvider.notifier).stop;
    final Function pauseFunc = ref.read(timerStateProvider.notifier).pause;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Timer"),
        TimeWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                startFunc();
              },
              child: Text("Start"),
            ),
            ElevatedButton(
              onPressed: () {
                pauseFunc();
              },
              child: Text("Pause"),
            ),
            ElevatedButton(
              onPressed: () {
                stopFunc();
              },
              child: Text("Stop"),
            ),
          ],
        ),
      ],
    );
  }
}

class TimeWidget extends ConsumerWidget {
  String _timeToString(int time) {
    final int hour = time ~/ 3600;
    final int minute = (time % 3600) ~/ 60;
    final int second = time % 60;
    return "$hour:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int time = ref.watch(timerStateProvider).currentTime;
    return Text(_timeToString(time));
  }
}