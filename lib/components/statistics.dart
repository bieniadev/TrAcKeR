import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/models/expence.dart';
import 'package:tracker/providers/expences_list.dart';
import 'package:tracker/providers/sum.dart';

class Statistics extends ConsumerWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sum = ref.watch(sumProvider);
    List<dynamic> expencesList = ref.watch(expencesListProvider);
    for (Expence expence in expencesList) {
      sum += expence.amount;
    }
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Center(
            child: Text(
          'SUMA: ${sum}zł',
          style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 20, fontWeight: FontWeight.w500, wordSpacing: 1),
        )),
      ),
    );
  }
}
