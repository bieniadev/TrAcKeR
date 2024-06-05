import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/boxes.dart';
import 'package:tracker/models/expence.dart';
import 'package:tracker/providers/expences_list.dart';

class ExpencesItem extends ConsumerWidget {
  const ExpencesItem({super.key, required this.expence});

  final Expence expence;

  showOptionsMenu(BuildContext context, String uuid, WidgetRef ref, String desc) {
    List<PopupMenuEntry<dynamic>> menuItems = [
      PopupMenuItem(
        labelTextStyle: MaterialStatePropertyAll(GoogleFonts.josefinSans(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Change desc'),
            Icon(Icons.edit_rounded, color: Theme.of(context).colorScheme.inversePrimary),
          ],
        ),
      ),
      PopupMenuItem(
        labelTextStyle: MaterialStatePropertyAll(GoogleFonts.josefinSans(color: Colors.red[300], fontSize: 18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Delete'),
            Icon(Icons.delete_forever_rounded, color: Colors.red[300]),
          ],
        ),
        onTap: () => removeExpence(ref, uuid, context, desc),
      ),
    ];

    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox bar = context.findRenderObject() as RenderBox;
    RelativeRect menuPosition = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    showMenu(
      context: context,
      position: menuPosition,
      items: menuItems,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  void removeExpence(WidgetRef ref, String uuid, BuildContext context, String desc) {
    List<Expence> expencesList = ref.read(expencesListProvider).map((dynamicItem) => dynamicItem as Expence).toList();
    expencesList.removeWhere((expense) => expense.uuid == uuid);

    List<Expence> newList = [...expencesList];
    ref.read(expencesListProvider.notifier).state = newList;
    boxExpences.put(1, newList);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text('Deleted: $desc!'),
      backgroundColor: Colors.red[300],
    ));
    // Tutaj możesz dodać obsługę dodatkowych operacji po usunięciu wydatku, jeśli jest to potrzebne
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey key = GlobalKey();
    return GestureDetector(
      key: key,
      onLongPress: () => showOptionsMenu(context, expence.uuid, ref, expence.desc),
      child: Card(
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
      ),
    );
  }
}
