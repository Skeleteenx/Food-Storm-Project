import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenProvider extends ChangeNotifier {
  onMapCreated(GoogleMapController mapController, dynamic controller) {
    mapController = controller;
    notifyListeners();
  }
}
