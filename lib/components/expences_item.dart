import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/models/expence.dart';

class ExpencesItem extends StatelessWidget {
  const ExpencesItem({super.key, required this.expence});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expence.desc,
                  style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 14),
                ),
                Text(
                  expence.category,
                  style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: expence.amount.toStringAsFixed(2),
                style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8), fontSize: 18),
              ),
              TextSpan(
                text: ' zł',
                style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.8), fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
