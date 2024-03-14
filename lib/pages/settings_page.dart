import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int weightChange = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.bebasNeue(fontSize: 35),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 35),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
