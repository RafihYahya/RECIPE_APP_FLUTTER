// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarked_recipe_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkedRecipeDataAdapter extends TypeAdapter<BookMarkedRecipeData> {
  @override
  final int typeId = 1;

  @override
  BookMarkedRecipeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkedRecipeData(
      recipeMainData: (fields[0] as List).cast<String?>(),
      recipeBoolData: (fields[1] as List).cast<bool>(),
      bkIngredsData: (fields[3] as List?)?.cast<dynamic>(),
      bkInstructsData: (fields[2] as List?)?.cast<String?>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkedRecipeData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.recipeMainData)
      ..writeByte(1)
      ..write(obj.recipeBoolData)
      ..writeByte(2)
      ..write(obj.bkInstructsData)
      ..writeByte(3)
      ..write(obj.bkIngredsData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkedRecipeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
