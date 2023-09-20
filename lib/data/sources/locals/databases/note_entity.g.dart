// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

part of 'note_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteEntityAdapter extends TypeAdapter<_$_NoteEntity> {
  @override
  final int typeId = 1;

  @override
  _$_NoteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NoteEntity(
      title: fields[0] as String,
      body: fields[1] as String,
      isFavorite: fields[2] == null ? false : fields[2] as bool,
      lastUpdatedAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NoteEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.isFavorite)
      ..writeByte(3)
      ..write(obj.lastUpdatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
