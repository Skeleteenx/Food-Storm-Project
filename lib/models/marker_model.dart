class MarkerModel{
  String latitude;
  String longitude;
  String nameInstitution;

  MarkerModel({
    required this.nameInstitution,
    required this.latitude,
    required this.longitude,
});

  MarkerModel.fromjson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'],
        nameInstitution = json['nameInstitution'];

  Map<String, dynamic> toJson() =>
      {
        'latitude': latitude,
        'longitude': longitude,
        'nameInstitution': nameInstitution
      };
}