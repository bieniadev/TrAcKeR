import 'package:hive/hive.dart';

part 'expence.g.dart';

@HiveType(typeId: 1)
class Expence extends HiveObject {
  @HiveField(0)
  String desc;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String category;

  Expence({
    required this.desc,
    required this.amount,
    required this.category,
  });
}
