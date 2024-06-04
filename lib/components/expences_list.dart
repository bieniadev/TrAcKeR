import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/components/expences_item.dart';
import 'package:tracker/providers/expences_list.dart';

class ExpencesList extends ConsumerStatefulWidget {
  const ExpencesList({super.key});

  @override
  ConsumerState<ExpencesList> createState() => _ExpencesListState();
}

class _ExpencesListState extends ConsumerState<ExpencesList> {
  List<dynamic> _expencesList = [];
  @override
  Widget build(BuildContext context) {
    _expencesList = ref.watch(expencesListProvider) ?? [];

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: _expencesList.length,
        itemBuilder: (context, index) {
          return ExpencesItem(
            index: index,
            expence: _expencesList[index],
          );
        },
      ),
    );
  }
}
