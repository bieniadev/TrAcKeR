import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/boxes.dart';

final expencesListProvider = StateProvider<List<dynamic>>((_) {
  return boxExpences.get(1) ?? [];
});
