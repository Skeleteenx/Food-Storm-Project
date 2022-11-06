import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject {

  @HiveField(0)
  late String? basic_description;

  @HiveField(1)
  late String? short_description;

  @HiveField(2)
  late String? email;

  @HiveField(3)
  late String? end_date;

  @HiveField(4)
  late String? name_institution;

  @HiveField(5)
  late String? name_stocks;

  @HiveField(6)
  late String? start_date;

  @HiveField(7)
  late String? phone_number;

  @HiveField(8)
  late String? information_about_the_rest;

  @HiveField(9)
  late String? operating_mode;

  @HiveField(10)
  late String? share_size;

  @HiveField(11)
  late String? res_rating;

  @HiveField(12)
  late String? image;

  @HiveField(13)
  late String? icon_res;

  @HiveField(14)
  late String? full_address;

  @HiveField(15)
  late String? short_address;

  @HiveField(16)
  late String? linkToTheInt;

  @HiveField(17)
  late String? linkToTheVk;

  @HiveField(18)
  late List<dynamic>? tags;

  @HiveField(19)
  late List<dynamic>? url_photos;

  HiveModel({
    this.basic_description,
    this.short_description,
    this.email,
    this.end_date,
    this.name_institution,
    this.name_stocks,
    this.phone_number,
    this.information_about_the_rest,
    this.start_date,
    this.operating_mode,
    this.res_rating,
    this.share_size,
    this.image,
    this.icon_res,
    this.full_address,
    this.short_address,
    this.linkToTheInt,
    this.linkToTheVk,
    this.tags,
    this.url_photos
  });
}