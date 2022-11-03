// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelAdapter extends TypeAdapter<HiveModel> {
  @override
  final int typeId = 0;

  @override
  HiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModel(
      basic_description: fields[0] as String?,
      short_description: fields[1] as String?,
      email: fields[2] as String?,
      end_date: fields[3] as String?,
      name_institution: fields[4] as String?,
      name_stocks: fields[5] as String?,
      phone_number: fields[7] as String?,
      information_about_the_rest: fields[8] as String?,
      start_date: fields[6] as String?,
      operating_mode: fields[9] as String?,
      res_rating: fields[11] as String?,
      share_size: fields[10] as String?,
      image: fields[12] as String?,
      icon_res: fields[13] as String?,
      full_address: fields[14] as String?,
      short_address: fields[15] as String?,
      linkToTheInt: fields[16] as String?,
      linkToTheVk: fields[17] as String?,
      tags: (fields[18] as List?)?.cast<dynamic>(),
      url_photos: (fields[19] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.basic_description)
      ..writeByte(1)
      ..write(obj.short_description)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.end_date)
      ..writeByte(4)
      ..write(obj.name_institution)
      ..writeByte(5)
      ..write(obj.name_stocks)
      ..writeByte(6)
      ..write(obj.start_date)
      ..writeByte(7)
      ..write(obj.phone_number)
      ..writeByte(8)
      ..write(obj.information_about_the_rest)
      ..writeByte(9)
      ..write(obj.operating_mode)
      ..writeByte(10)
      ..write(obj.share_size)
      ..writeByte(11)
      ..write(obj.res_rating)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.icon_res)
      ..writeByte(14)
      ..write(obj.full_address)
      ..writeByte(15)
      ..write(obj.short_address)
      ..writeByte(16)
      ..write(obj.linkToTheInt)
      ..writeByte(17)
      ..write(obj.linkToTheVk)
      ..writeByte(18)
      ..write(obj.tags)
      ..writeByte(19)
      ..write(obj.url_photos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
