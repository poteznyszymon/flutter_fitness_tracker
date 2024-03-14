import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/exercise_set.dart';

class ExercisePage extends StatefulWidget {
  final String exerciseName;
  const ExercisePage({Key? key, required this.exerciseName}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int reps = 5;
  int weight = 40;
  int weightChange = 5;
  TextEditingController repsController = TextEditingController(text: '5');
  TextEditingController weightController = TextEditingController(text: '40');
  late Exercise exercise;

  void addReps() {
    setState(() {
      reps += 1;
      repsController.text = reps.toString();
    });
  }

  reduceReps() {
    if (reps > 0) {
      setState(() {
        reps -= 1;
        repsController.text = reps.toString();
      });
    }
  }

  void addWeight() {
    setState(() {
      weight += weightChange;
      weightController.text = weight.toString();
    });
  }

  void reduceWeight() {
    if (weight > 0) {
      setState(() {
        weight -= weightChange;
        weightController.text = weight.toString();
      });
    }
  }

  void addSet() {
    setState(() {
      exercise.addSet(
          int.parse(weightController.text), int.parse(repsController.text));
    });
  }

  void deleteSet(int index) {
    setState(() {
      exercise.removeSet(index);
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    exercise = Exercise(widget.exerciseName, weights: [], repetitions: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'FintessTracker',
          style: GoogleFonts.bebasNeue(fontSize: 35),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 35),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/settings_page'),
            icon: const Icon(Icons.settings, size: 25),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              widget.exerciseName,
              style:
                  GoogleFonts.bebasNeue(fontSize: 45, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reps',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 25, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () => addReps(),
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Container(
                        width: 50,
                        child: TextField(
                          maxLength: 2,
                          controller: repsController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          style: GoogleFonts.bebasNeue(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => reduceReps(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => addWeight(),
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Container(
                        width: 70,
                        child: TextField(
                          maxLength: 3,
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          style: GoogleFonts.bebasNeue(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => reduceWeight(),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => addSet(),
            style: ElevatedButton.styleFrom(
              elevation: 2,
              minimumSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
            ),
            child: Text(
              "Add",
              style: GoogleFonts.bebasNeue(fontSize: 35),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemExtent: 60,
              itemCount: exercise.weights.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.bebasNeue(
                          fontSize: 20, color: Colors.grey[600]),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          "Reps:  ${exercise.repetitions[index]}",
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20, color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 80),
                        Text(
                          'Weight  ${exercise.weights[index]}',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20, color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 40),
                        IconButton(
                            onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: Colors.grey[100],
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () => deleteSet(index),
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(350, 100),
                                            backgroundColor: Colors.red),
                                        child: Text('Delete',
                                            style: GoogleFonts.bebasNeue(
                                                fontSize: 40)),
                                      ),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(350, 100),
                                        ),
                                        child: Text('Cancel',
                                            style: GoogleFonts.bebasNeue(
                                                fontSize: 40)),
                                      ),
                                    ],
                                  ),
                                ),
                            icon: const Icon(Icons.more_vert))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
