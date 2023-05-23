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
      children: [
        Text("Timer"),
        Text(time.toString()),
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
    );
  }
}
