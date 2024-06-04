import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/boxes.dart';
import 'package:tracker/providers/darkmode.dart';

class AppBarSwitchable extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppBarSwitchable({super.key});

  @override
  ConsumerState<AppBarSwitchable> createState() => _AppBarSwitchableState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarSwitchableState extends ConsumerState<AppBarSwitchable> {
  bool _isDarkmode = false;

  @override
  Widget build(BuildContext context) {
    _isDarkmode = ref.read(isDarkmodeProvider);
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text('TrAcKeR', style: GoogleFonts.seymourOne(fontSize: 24, color: Theme.of(context).colorScheme.inversePrimary)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: _isDarkmode ? Icon(Icons.wb_sunny, color: Theme.of(context).colorScheme.inversePrimary) : Icon(Icons.nightlight_round, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          onPressed: () {
            setState(() => _isDarkmode = !_isDarkmode);

            ref.read(isDarkmodeProvider.notifier).state = _isDarkmode;
            boxIsDarkmode.put(1, _isDarkmode);
          },
        )
      ],
    );
  }
}
