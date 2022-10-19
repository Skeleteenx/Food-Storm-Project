import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel{
  LatLng location;
  String nameInstitution;

  PlaceModel({
    required this.nameInstitution,
    required this.location
});
}