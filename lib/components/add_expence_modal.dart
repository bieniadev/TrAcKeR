import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tracker/boxes.dart';
import 'package:tracker/models/expence.dart';
import 'package:tracker/providers/expences_list.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:uuid/uuid.dart';

class AddExpenceModal extends ConsumerStatefulWidget {
  const AddExpenceModal({super.key});

  @override
  ConsumerState<AddExpenceModal> createState() => _AddExpenceModalState();
}

class _AddExpenceModalState extends ConsumerState<AddExpenceModal> {
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  SingleValueDropDownController categoryDropdownController = SingleValueDropDownController();
  DateTime _selectedDate = DateTime.now();

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
    if (categoryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text('Select category!'),
        backgroundColor: Colors.red[300],
      ));
      return;
    }
    if (descController.text.isEmpty) {
      descController.text = 'Nieopisany wydatek';
    }
    Uuid uuid = const Uuid();
    Expence newExpence = Expence(
      desc: descController.text,
      amount: amount,
      category: categoryController.text,
      creationDate: _selectedDate,
      uuid: uuid.v4(),
    );
    List<dynamic> oldList = ref.read(expencesListProvider) ?? [];
    List<dynamic> newList = [...oldList, newExpence];
    ref.read(expencesListProvider.notifier).state = newList;
    boxExpences.put(1, newList);
    Navigator.of(context).pop();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime firstDate = DateTime(today.year, 1, 1);
    DateTime lastDate = DateTime(today.year, 12, 31);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      // barrierColor: Colors.red,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    descController.dispose();
    amountController.dispose();
    categoryController.dispose();
    categoryDropdownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Expence> expencesList = ref.read(expencesListProvider).map((dynamicItem) => dynamicItem as Expence).toList();
    List<String> categoryList = expencesList.map((expence) => expence.category).toSet().toList();
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          const SizedBox(height: 6),
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
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DropDownTextField(
                  dropDownList: List.generate(categoryList.length, (index) => DropDownValueModel(name: categoryList[index], value: index)),
                  controller: categoryDropdownController,
                  enableSearch: true,
                  keyboardType: TextInputType.text,
                  listTextStyle: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.9)),
                  textStyle: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary),
                  searchTextStyle: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)),
                  searchDecoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65))),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                  textFieldDecoration: InputDecoration(
                    label: Text('Select Category', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.65)), borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary), borderRadius: BorderRadius.circular(10)),
                  ),
                  dropDownIconProperty: IconProperty(color: Theme.of(context).colorScheme.onPrimary),
                  clearIconProperty: IconProperty(color: Theme.of(context).colorScheme.onPrimary),
                  onChanged: (value) {
                    categoryController.text = categoryDropdownController.dropDownValue!.name;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: TextField(
                  controller: categoryController,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16),
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  decoration: InputDecoration(
                    label: Text('New Category', style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16)),
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
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(DateFormat('dd.MM.yyyy').format(_selectedDate), style: GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18)),
                  const SizedBox(width: 8),
                  Icon(Icons.calendar_month_rounded, color: Theme.of(context).colorScheme.onPrimary, size: 22),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
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
