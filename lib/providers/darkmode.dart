import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/boxes.dart';

final isDarkmodeProvider = StateProvider<bool>((_) {
  return boxIsDarkmode.get(1) ?? false;
});
