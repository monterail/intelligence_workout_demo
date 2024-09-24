import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intelligence_demo_hr_tech/src/workout_feature/workout.dart';
import 'package:rxdart/rxdart.dart';

@RoutePage()
class WorkoutDetailsView extends StatefulWidget {
  const WorkoutDetailsView({super.key, @PathParam() required this.id});

  final String id;

  @override
  State<WorkoutDetailsView> createState() => _WorkoutDetailsViewState();
}

class _WorkoutDetailsViewState extends State<WorkoutDetailsView> {
  Workout get workout => workouts.firstWhere((c) => c.id == widget.id);

  var counter = 0;
  bool get countdownInProgress => counter < 0;

  late final StreamSubscription<int> _counterSub;

  @override
  void initState() {
    super.initState();
    var counterIndex = 0;
    _counterSub = Stream.fromIterable([
      for (int i = -3; i < 0; i++) i,
      for (int i = 30; i >= 0; i--) i,
      for (int i = 60; i >= 0; i--) i,
      for (int i = 20; i >= 0; i--) i,
    ])
        .flatMap((i) => TimerStream(i, Duration(seconds: 1 * counterIndex++)))
        .listen((counter) {
      setState(() {
        this.counter = counter;
      });
    });
  }

  @override
  void dispose() {
    _counterSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Workout(:name, :duration) = workout;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(name),
            Text(
              '${duration.inMinutes} minutes',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (countdownInProgress) ...[
              const Text(
                'Get ready!',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
              Text(
                counter.toString(),
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ] else ...[
              const Text(
                'Exercise 1',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Round 1/3',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Text(
                counter.toString(),
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class Labeled extends StatelessWidget {
  const Labeled({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
