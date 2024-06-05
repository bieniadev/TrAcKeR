import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/components/expences_item.dart';
import 'package:tracker/models/expence.dart';
import 'package:tracker/providers/expences_list.dart';
import 'package:intl/intl.dart';

class ExpencesList extends ConsumerStatefulWidget {
  const ExpencesList({super.key});

  @override
  ConsumerState<ExpencesList> createState() => _ExpencesListState();
}

class _ExpencesListState extends ConsumerState<ExpencesList> {
  List<Expence> _expencesList = [];
  @override
  Widget build(BuildContext context) {
    _expencesList = ref.watch(expencesListProvider).map((dynamicItem) => dynamicItem as Expence).toList();

    Map<String, List<Expence>> groupExpensesByDate(List<Expence> expenses) {
      Map<String, List<Expence>> groupedExpenses = {};

      for (var expense in expenses) {
        String formattedDate = DateFormat('dd.MM.yyyy').format(expense.creationDate);
        if (!groupedExpenses.containsKey(formattedDate)) {
          groupedExpenses[formattedDate] = [];
        }
        groupedExpenses[formattedDate]!.add(expense);
      }

      return groupedExpenses;
    }

    Map<String, List<Expence>> groupedExpenses = groupExpensesByDate(_expencesList);

    List<String> dateKeys = groupedExpenses.keys.toList()..sort((a, b) => DateFormat('dd.MM.yyyy').parse(b).compareTo(DateFormat('dd.MM.yyyy').parse(a)));
    List<Widget> displayList = [];

    for (var date in dateKeys) {
      displayList.add(Text(
        date,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)),
        textAlign: TextAlign.center,
      ));
      for (var expense in groupedExpenses[date]!) {
        displayList.add(ExpencesItem(expence: expense));
      }
    }
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          return displayList[index];
        },
      ),
    );
  }
}
