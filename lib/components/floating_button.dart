import 'package:flutter/material.dart';
import 'package:tracker/components/add_expence_modal.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    void showAddExpenceModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // useSafeArea: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          //   return Scaffold(
          //     extendBody: false,
          //     // key: modelScaffoldKey,
          //     // resizeToAvoidBottomInset: true,
          //     backgroundColor: Theme.of(context).colorScheme.secondary,
          //     body: const AddExpenceModal(),
          //   );
          return const AddExpenceModal();
        },
      );
    }

    return FloatingActionButton(
      onPressed: showAddExpenceModal,
      child: Icon(
        Icons.add_rounded,
        color: Theme.of(context).colorScheme.onSecondary,
        size: 50,
      ),
    );
  }
}
