const workouts = [
  Workout(
    id: '1',
    name: 'Running',
    duration: Duration(minutes: 30),
  ),
  Workout(
    id: '2',
    name: 'Cycling',
    duration: Duration(minutes: 45),
  ),
  Workout(
    id: '3',
    name: 'Swimming',
    duration: Duration(minutes: 60),
  ),
  Workout(
    id: '4',
    name: 'Yoga',
    duration: Duration(minutes: 20),
  ),
  Workout(
    id: '5',
    name: 'Weight Lifting',
    duration: Duration(minutes: 50),
  ),
  Workout(
    id: '6',
    name: 'Pilates',
    duration: Duration(minutes: 40),
  ),
  Workout(
    id: '7',
    name: 'Boxing',
    duration: Duration(minutes: 35),
  ),
  Workout(
    id: '8',
    name: 'Zumba',
    duration: Duration(minutes: 55),
  ),
  Workout(
    id: '9',
    name: 'Dancing',
    duration: Duration(minutes: 25),
  ),
  Workout(
    id: '10',
    name: 'Hiking',
    duration: Duration(minutes: 90),
  ),
];

class Workout {
  final String id, name;
  final Duration duration;

  const Workout({
    required this.id,
    required this.name,
    required this.duration,
  });
}
