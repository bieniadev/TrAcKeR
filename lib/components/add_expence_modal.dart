import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/boxes.dart';
import 'package:tracker/models/expence.dart';
import 'package:tracker/providers/expences_list.dart';

class AddExpenceModal extends ConsumerStatefulWidget {
  const AddExpenceModal({super.key});

  @override
  ConsumerState<AddExpenceModal> createState() => _AddExpenceModalState();
}

class _AddExpenceModalState extends ConsumerState<AddExpenceModal> {
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  void _addExpence() {
    double? amount = double.tryParse(amountController.text);
    if (amount == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text('Wrong type amount!'),
        backgroundColor: Colors.red[300],
      ));
      return;
    }
    Expence newExpence = Expence(desc: descController.text, amount: amount, category: categoryController.text);
    List<dynamic> oldList = ref.read(expencesListProvider) ?? [];
    List<dynamic> newList = [...oldList, newExpence];
    ref.read(expencesListProvider.notifier).state = newList;
    boxExpences.put(1, newList);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Text('Add Expence', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onSecondary, fontSize: 22)),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                flex: 5,
                child: TextField(
                  controller: descController,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  decoration: InputDecoration(
                    label: Text('Description', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)), borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary), borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 2,
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  decoration: InputDecoration(
                    label: Text('Amount', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)), borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary), borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: categoryController,
            keyboardType: TextInputType.text,
            style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              label: Text('Category', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)), borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary), borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: _addExpence,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.all(8),
              child: Text('Confirm', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onSecondary, fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }
}
