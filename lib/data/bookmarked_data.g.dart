// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarked_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkedRecipesListAdapter extends TypeAdapter<BookMarkedRecipesList> {
  @override
  final int typeId = 0;

  @override
  BookMarkedRecipesList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkedRecipesList(
      itemcount: fields[0] as int,
      bkList: (fields[1] as List?)?.cast<BookMarkedRecipeData>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkedRecipesList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.itemcount)
      ..writeByte(1)
      ..write(obj.bkList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkedRecipesListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
