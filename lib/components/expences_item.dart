import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/models/expence.dart';

class ExpencesItem extends StatelessWidget {
  const ExpencesItem({super.key, required this.index, required this.expence});

  final int index;
  final Expence expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              expence.desc,
              style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 14),
            ),
            Text(
              '${expence.amount}zł',
              style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.8), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
