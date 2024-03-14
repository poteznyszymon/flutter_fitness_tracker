class Workoutset {
  List workouts = [
    [
      'push',
      'bench press',
      'incline bench press',
      'pactoral Fly',
      'hammer shoulder press',
      'lateral line rise',
      'skull crusher'
    ],
    [
      'pull',
      'pull-ups',
      'seated row',
      'singe arm lat pulldown',
      'lat prayer',
      'reverse barberl curls',
      'incline dumbell curls',
      'reverse butterfly'
    ],
    [
      'legs',
      'hack squat',
      'leg press',
      'leg extension',
      'leg curl',
      'calf raises'
    ],
  ];

  void addWorkout(String workout) {
    workouts.add([workout]);
  }

  void removeWorkout(int index) {
    workouts.removeAt(index);
  }

  void addExercise(String workoutName, String exercise) {
    int workoutIndex = getIndex(workoutName);
    if (workoutIndex != -1) {
      workouts[workoutIndex].add(exercise);
    }
  }

  void removeExercise(String workoutName, int index) {
    int workoutIndex = getIndex(workoutName);
    if (workoutIndex != -1) {
      workouts[workoutIndex].removeAt(index);
    }
  }

  int returnLength() {
    return workouts.length;
  }

  int getIndex(String workoutName) {
    for (int i = 0; i < workouts.length; i++) {
      if (workouts[i].contains(workoutName)) {
        return i;
      }
    }
    return -1;
  }

  int returnExercisesLenght(name) {
    int index = getIndex(name);
    return workouts[index].length;
  }
}
