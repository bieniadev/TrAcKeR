import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'expence.g.dart';

@HiveType(typeId: 1)
class Expence extends HiveObject {
  @HiveField(0)
  String uuid;

  @HiveField(1)
  String desc;

  @HiveField(2)
  double amount;

  @HiveField(3)
  String category;

  @HiveField(4)
  DateTime creationDate;

  Expence({
    required this.desc,
    required this.amount,
    required this.category,
    required this.creationDate,
  }) : uuid = const Uuid().v4();
}
