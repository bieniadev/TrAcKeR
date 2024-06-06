import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/models/expence.dart';
import 'package:tracker/providers/expences_list.dart';

class CircleChart extends ConsumerWidget {
  const CircleChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Expence> expencesList = ref.watch(expencesListProvider).map((dynamicItem) => dynamicItem as Expence).toList();
    Map<String, double> categoriesWorth = {};
    for (Expence expence in expencesList) {
      if (categoriesWorth.containsKey(expence.category)) {
        categoriesWorth[expence.category] = categoriesWorth[expence.category]! + expence.amount;
      } else {
        categoriesWorth[expence.category] = expence.amount;
      }
    }

    List<PieChartSectionData> sections = categoriesWorth.entries.map((entry) {
      Expence expence = expencesList.firstWhere((exp) => exp.category == entry.key);
      return PieChartSectionData(
        value: entry.value,
        title: '${entry.value.toStringAsFixed(2)}zł',
        color: expence.color,
        radius: 135,
        titlePositionPercentageOffset: 0.7,
        borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.85), width: 1),
        titleStyle: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 14, fontWeight: FontWeight.w500),
      );
    }).toList();

    return expencesList.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            height: 300,
            child: Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 0,
                      sections: sections,
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox(height: 0, width: 0);
  }
}
