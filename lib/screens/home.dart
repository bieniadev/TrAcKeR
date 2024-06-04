import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/components/appbar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarSwitchable(),
      body: Center(
        child: Text(
          'Sample text',
          style: GoogleFonts.imperialScript(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }
}
