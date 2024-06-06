import 'package:flutter/material.dart';
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

  @HiveField(5)
  int colorValue;

  Expence({
    required this.desc,
    required this.amount,
    required this.category,
    required this.creationDate,
    required this.colorValue,
  }) : uuid = const Uuid().v4();
  Color get color => Color(colorValue); // Getter do pobierania koloru jako Color

  static int _colorIndex = 0;
  static const List<Color> _predefinedColors = [
    Color(0xff0293ee),
    Color(0xfff8b250),
    Color(0xff845bef),
    Color(0xff13d38e),
    Color(0xfff441a5),
    Color(0xffe8505b),
    Color(0xfffaee1c),
    Color(0xff91e8e1),
    Color(0xffa6c96a),
    Color(0xff8085e9),
    Color(0xfff45b5b),
    Color(0xffe4d354),
  ];

  static final Map<String, Color> _categoryColors = {};

  static Color getColorForCategory(String category) {
    if (!_categoryColors.containsKey(category)) {
      _categoryColors[category] = _predefinedColors[_colorIndex % _predefinedColors.length];
      _colorIndex++;
    }
    return _categoryColors[category]!;
  }
}
