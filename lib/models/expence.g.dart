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
      desc: fields[0] as String,
      amount: fields[1] as double,
      category: fields[2] as String,
      creationDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Expence obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.desc)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
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
