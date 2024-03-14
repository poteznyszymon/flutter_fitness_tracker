import 'package:fitness/pages/exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/workout_set.dart';

class WorkOut extends StatefulWidget {
  final String workoutName;
  const WorkOut({Key? key, required this.workoutName}) : super(key: key);

  @override
  State<WorkOut> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkOut> {
  var workoutSet = Workoutset();
  final _exerciseController = TextEditingController();

  void addNewExercise() {
    setState(() {
      if (_exerciseController.text != '') {
        workoutSet.addExercise(widget.workoutName, _exerciseController.text);
        _exerciseController.clear();
      }
    });
    Navigator.pop(context);
  }

  void deleteExercise(int index) {
    setState(() {
      workoutSet.removeExercise(widget.workoutName, index);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Add new exercise',
                style: GoogleFonts.bebasNeue(fontSize: 30)),
            content: TextField(
              controller: _exerciseController,
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: GoogleFonts.bebasNeue(
                    fontSize: 20, color: Colors.grey[500]),
              ),
              style: GoogleFonts.bebasNeue(fontSize: 25),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 20, color: Colors.red[300])),
              ),
              TextButton(
                onPressed: () => addNewExercise(),
                child: Text('Add', style: GoogleFonts.bebasNeue(fontSize: 20)),
              ),
            ],
          ),
        ),
        label: Row(
          children: [
            Text("Add exercise", style: GoogleFonts.bebasNeue(fontSize: 23)),
            const Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
        icon: Container(),
      ),
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
          Expanded(
            child: ListView.builder(
              itemExtent: 90,
              itemCount:
                  workoutSet.returnExercisesLenght(widget.workoutName) - 1,
              itemBuilder: (context, index) {
                index += 1;
                return Card(
                  child: ListTile(
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert, size: 40),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.grey[100],
                          actions: [
                            ElevatedButton(
                              onPressed: () => deleteExercise(index),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(350, 100),
                                  backgroundColor: Colors.red),
                              child: Text('Delete',
                                  style: GoogleFonts.bebasNeue(fontSize: 40)),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 100),
                              ),
                              child: Text('Cancel',
                                  style: GoogleFonts.bebasNeue(fontSize: 40)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: Text(
                      workoutSet
                              .workouts[workoutSet.getIndex(widget.workoutName)]
                          [index],
                      style: GoogleFonts.bebasNeue(
                          fontSize: 30, color: Colors.grey[600]),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExercisePage(
                          exerciseName: workoutSet.workouts[
                              workoutSet.getIndex(widget.workoutName)][index],
                        ),
                      ),
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
