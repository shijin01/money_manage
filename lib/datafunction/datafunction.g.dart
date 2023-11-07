// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datafunction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategorydataAdapter extends TypeAdapter<Categorydata> {
  @override
  final int typeId = 1;

  @override
  Categorydata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categorydata(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as Categorytype,
    )..isdiabled = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Categorydata obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.isdiabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorydataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategorytypeAdapter extends TypeAdapter<Categorytype> {
  @override
  final int typeId = 2;

  @override
  Categorytype read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Categorytype.income;
      case 1:
        return Categorytype.expense;
      default:
        return Categorytype.income;
    }
  }

  @override
  void write(BinaryWriter writer, Categorytype obj) {
    switch (obj) {
      case Categorytype.income:
        writer.writeByte(0);
        break;
      case Categorytype.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorytypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
