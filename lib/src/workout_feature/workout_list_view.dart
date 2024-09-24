import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence/model/representable.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.gr.dart';
import 'package:intelligence_demo_hr_tech/src/workout_feature/workout.dart';

@RoutePage()
class WorkoutListView extends StatefulWidget {
  const WorkoutListView({super.key});

  @override
  State<WorkoutListView> createState() => _WorkoutListViewState();
}

class _WorkoutListViewState extends State<WorkoutListView> {
  @override
  void initState() {
    super.initState();
    Intelligence().populate(
      workouts
          .map((workout) =>
              Representable(representation: workout.name, id: workout.id))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: workouts.length,
        itemBuilder: (BuildContext context, int index) {
          final Workout(:id, :name, :duration) = workouts[index];

          return ListTile(
            title: Text(name),
            leading: CircleAvatar(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: duration.inMinutes.toString()),
                    const TextSpan(text: 'm', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            onTap: () {
              context.router.push(WorkoutDetailsRoute(id: id));
            },
          );
        },
      ),
    );
  }
}
