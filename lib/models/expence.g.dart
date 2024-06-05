// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expence.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenceAdapter extends TypeAdapter<Expence> {
  @override
  final int typeId = 1;

  @override
  Expence read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expence(
      desc: fields[1] as String,
      amount: fields[2] as double,
      category: fields[3] as String,
      creationDate: fields[4] as DateTime,
    )..uuid = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Expence obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
