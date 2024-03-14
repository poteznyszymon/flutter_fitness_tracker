class Exercise {
  String name;
  late List<int> weights;
  late List<int> repetitions;

  Exercise(this.name, {List<int>? weights, List<int>? repetitions}) {
    this.weights = weights ?? [];
    this.repetitions = repetitions ?? [];
  }

  void addSet(int weight, int repetition) {
    weights.add(weight);
    repetitions.add(repetition);
  }

  void removeSet(int index) {
    weights.removeAt(index);
    repetitions.removeAt(index);
  }
}
