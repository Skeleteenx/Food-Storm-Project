import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  String nameInstitution;
  LatLng location;

  PlaceModel({
    required this.nameInstitution,
    required this.location,
  });
}
