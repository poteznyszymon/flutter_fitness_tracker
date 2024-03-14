import 'package:fitness/pages/workout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/workout_set.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var workoutSet = Workoutset();

  final _workoutController = TextEditingController();

  void addNewWorkout() {
    setState(() {
      if (_workoutController.text != '') {
        workoutSet.addWorkout(_workoutController.text);
        _workoutController.clear();
      }
    });
    Navigator.pop(context);
  }

  void deleteWorkout(int index) {
    setState(() {
      workoutSet.removeWorkout(index);
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
            title: Text('Add new workout',
                style: GoogleFonts.bebasNeue(fontSize: 30)),
            content: TextField(
              controller: _workoutController,
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
                onPressed: () => addNewWorkout(),
                child: Text('Add', style: GoogleFonts.bebasNeue(fontSize: 20)),
              ),
            ],
          ),
        ),
        label: Row(
          children: [
            Text("Add workout", style: GoogleFonts.bebasNeue(fontSize: 23)),
            const Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
        icon: Container(),
      ),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leadingWidth: 35,
        leading: const Row(
          children: [
            SizedBox(width: 10),
            Icon(
              Icons.fitness_center,
              size: 25,
            ),
          ],
        ),
        title: Text(
          'FintessTracker',
          style: GoogleFonts.bebasNeue(fontSize: 35),
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
              itemExtent: 120,
              itemCount: workoutSet.returnLength(),
              itemBuilder: (context, index) {
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
                              onPressed: () => deleteWorkout(index),
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkOut(
                          workoutName: workoutSet.workouts[index][0],
                        ),
                      ),
                    ),
                    title: Text(
                      workoutSet.workouts[index][0],
                      style: GoogleFonts.bebasNeue(
                          fontSize: 40, color: Colors.grey[600]),
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
