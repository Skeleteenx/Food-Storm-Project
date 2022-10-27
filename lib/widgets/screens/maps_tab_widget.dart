import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsTabWidget extends StatefulWidget {
  const MapsTabWidget({Key? key}) : super(key: key);

  @override
  State<MapsTabWidget> createState() => _MapsTabWidgetState();
}

class _MapsTabWidgetState extends State<MapsTabWidget>
    with AutomaticKeepAliveClientMixin {

  Location location = Location();

  late BitmapDescriptor mapMarker;

  late GoogleMapController mapController;

  final _database = FirebaseFirestore.instance;
  //
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState(){
    fuckingMarkers();
    setCustomMarker();
    super.initState();
  }

  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        'assets/images/map-marker-Filled.png'
    );
  }

  fuckingMarkers() {
    _database.collection("stocks").get().then((documents) {
      if(documents.docs.isNotEmpty) {
        for(int i= 0; i < documents.docs.length; i++) {
          initMarker(documents.docs[i].data(), documents.docs[i].id);
    }
      }
    });
  }

  double parseDouble(dynamic value) {
    try {
      if (value is String) {
        return double.parse(value);
      } else if (value is double) {
        return value;
      } else {
        return 0.0;
      }
    } catch (e) {
      // return null if double.parse fails
      return 0.0;
    }
  }

  void initMarker(request, requestId) {
    var markerIdVal = requestId;
    final MarkerId markerId = MarkerId(markerIdVal.toString());

    final Marker marker = Marker(
      icon: mapMarker,
      markerId: markerId,
      position: LatLng(
          parseDouble(request['latitud']),
          parseDouble(request['longitud'])
      ),
      infoWindow: InfoWindow(
          title: request['name_institution'],
          snippet: request['full_address']
      ),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

   _onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return loadMap();
  }
  _animateToUser() async {
    var pos = await location.getLocation();
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    pos.latitude!.toDouble(),
                    pos.longitude!.toDouble()
                ),
                zoom: 17
            )
        )
    );
  }
  Widget loadMap(){
    return Stack(
        children:[
          GoogleMap(
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            markers: Set<Marker>.of(markers.values),
            myLocationEnabled: true,
            mapType: MapType.terrain,
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
                target: LatLng(55.78895962153182, 49.11796498244947),
                zoom: 15
            ),
          ),
          Positioned(
              bottom: 69,
              right: 10,
              child: SizedBox(
                height: 49,
                width: 49,
                child: FloatingActionButton(
                  onPressed: _animateToUser,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    CupertinoIcons.location_fill,
                    size: 27,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              )
          ),
          Positioned(
              bottom: 133,
              right: 10,
              child: SizedBox(
                height: 49,
                width: 49,
                child: FloatingActionButton(
                  onPressed: _animateToUser,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.car_detailed,
                      size: 33,
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                ),
              )
          ),
          Positioned(
              bottom: 197,
              right: 10,
              child: SizedBox(
                height: 49,
                width: 49,
                child: FloatingActionButton(
                  onPressed: _animateToUser,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.emoji_people,
                    size: 33,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              )
          )
        ]
    );
  }

  @override
  bool get wantKeepAlive => true;
}