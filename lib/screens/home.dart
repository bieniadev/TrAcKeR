import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('TrAcKeR', style: GoogleFonts.overpassMono(fontSize: 24, color: Theme.of(context).colorScheme.inversePrimary)),
        centerTitle: true,
        // actions: [Icon(themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny)],
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(Icons.nightlight_round, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            onPressed: () {
              print('Test');
            },
          )
        ],
      ),
      body: Center(
        child: Text('Sample text', style: GoogleFonts.imperialScript(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary)),
      ),
    );
  }
}
