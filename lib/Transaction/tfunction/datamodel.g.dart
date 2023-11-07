// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrancastinModelAdapter extends TypeAdapter<TrancastinModel> {
  @override
  final int typeId = 3;

  @override
  TrancastinModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrancastinModel(
      id: fields[0] as String,
      purpose: fields[1] as String,
      amt: fields[2] as String,
      date: fields[3] as DateTime,
      categorytype: fields[4] as Categorytype,
      categoryname: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrancastinModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.purpose)
      ..writeByte(2)
      ..write(obj.amt)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.categorytype)
      ..writeByte(5)
      ..write(obj.categoryname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrancastinModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
