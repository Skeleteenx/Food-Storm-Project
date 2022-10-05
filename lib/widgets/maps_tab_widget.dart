import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsTabWidget extends StatefulWidget {
  const MapsTabWidget({Key? key}) : super(key: key);

  @override
  State<MapsTabWidget> createState() => _MapsTabWidgetState();
}

class _MapsTabWidgetState extends State<MapsTabWidget> {

  Location location = new Location();

  late GoogleMapController mapController;

  final Set<Marker> _markers = {};

  // Completer<GoogleMapController> _controller = Completer();

   _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        GoogleMap(
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          mapType: MapType.normal,
          mapToolbarEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(55.7813726, 49.2132881),
            zoom: 15
          ),
      ),
        Positioned(
          bottom: 50,
            right: 10,
            child: SizedBox(
              height: 49,
              width: 49,
              child: FloatingActionButton(
                  onPressed: _animateToUser,
                backgroundColor: Color.fromRGBO(252, 252, 252, 1),
                  child: Icon(
                    Icons.emoji_people,
                    size: 33,
                    color: Color.fromRGBO(18, 18, 29, 0.8),
                ),
              ),
            )
        )
    ]
    );
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
}