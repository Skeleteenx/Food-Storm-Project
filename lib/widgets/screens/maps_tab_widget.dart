import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FoodStorm/helpers/constants.dart';
import '../../provider/buttons_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MapsTabWidget extends StatefulWidget {
  const MapsTabWidget({Key? key}) : super(key: key);

  @override
  State<MapsTabWidget> createState() => _MapsTabWidgetState();
}

class _MapsTabWidgetState extends State<MapsTabWidget> {
  Location location = Location();

  late BitmapDescriptor mapMarker;

  late GoogleMapController mapController;

  final _database = FirebaseFirestore.instance;

  dynamic controller;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    markersOfTolyatti();
    markersOfSamara();
    setCustomMarker();
    super.initState();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      ConstantsAssets.mapMarker,
    );
  }

  void markersOfSamara() {
    _database.collection(ConstantsKeys.samara).get().then(
      (documents) {
        if (documents.docs.isNotEmpty) {
          for (int i = 0; i < documents.docs.length; i++) {
            initMarker(
              documents.docs[i].data(),
              documents.docs[i].id,
            );
          }
        }
      },
    );
  }

  markersOfTolyatti() {
    _database.collection(ConstantsKeys.togliatti).get().then(
      (documents) {
        if (documents.docs.isNotEmpty) {
          for (int i = 0; i < documents.docs.length; i++) {
            initMarker(
              documents.docs[i].data(),
              documents.docs[i].id,
            );
          }
        }
      },
    );
  }

  double parseDouble(
    dynamic value,
  ) {
    try {
      if (value is String) {
        return double.parse(value);
      } else if (value is double) {
        return value;
      } else {
        return 0.0;
      }
    } catch (e) {
      return 0.0;
    }
  }

  void initMarker(
    request,
    requestId,
  ) {
    var markerIdVal = requestId;
    final MarkerId markerId = MarkerId(markerIdVal.toString());
    final Marker marker = Marker(
      icon: mapMarker,
      markerId: markerId,
      position: LatLng(
        parseDouble(request['latitud']),
        parseDouble(request['longitud']),
      ),
      infoWindow: InfoWindow(
        title: request['name_institution'],
        snippet: request['full_address'],
      ),
    );

    setState(
      () {
        markers[markerId] = marker;
      },
    );
  }

  _onMapCreated(controller) {
    setState(
      () {
        mapController = controller;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loadMap();
  }

  _animateToUser() async {
    var pos = await location.getLocation();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            pos.latitude!.toDouble(),
            pos.longitude!.toDouble(),
          ),
          zoom: 17.0,
        ),
      ),
    );
  }

  Widget loadMap() {
    // final mapProvider = Provider.of<MapScreenProvider>(context);
    final providerButt = Provider.of<ButtonsProvider>(context);
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          markers: Set<Marker>.of(markers.values),
          myLocationEnabled: true,
          mapType: MapType.terrain,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: providerButt.selectedCity == ConstantsKeys.selectedCity
                ? const LatLng(53.507852, 49.420411)
                : const LatLng(53.245876, 50.155199),
            zoom: 11.0,
          ),
        ),
        Positioned(
          bottom: 69.0,
          right: 10.0,
          child: SizedBox(
            height: 49.0,
            width: 49.0,
            child: FloatingActionButton(
              onPressed: _animateToUser,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                CupertinoIcons.location_fill,
                size: 27.0,
                color: Theme.of(context).shadowColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
