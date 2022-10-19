import 'package:FoodStorm/models/marker_model.dart';
import 'firestore_service.dart';

class MarkersRepo {
  final _service = FireMarkerService.instance;

  Stream<List<MarkerModel>> getMarkers() {
    return _service.collectionStream(
        path: 'stocks',
        builder:(json, docId){
          return MarkerModel.fromjson(json);
        }
    );
  }
}