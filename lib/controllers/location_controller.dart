import 'package:food_delivery_application/data/repositories/location_repo.dart';
import 'package:food_delivery_application/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();
  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addAddressList;
  List<AddressModel> _addAddressList = [];
  List<String> _addressTypeList = ['home', 'office', 'others'];
  int _addressTypeIndex = 0;
  bool _updateAddressData = true;
  late Map<String, dynamic> _getAddress;
  Map<String, dynamic> get getAddress => _getAddress;
// getter
  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  //for saving the google map address by the user
  late GoogleMapController _mapController;
  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  // updating the location
  void updatePosition(CameraPosition position, bool fromAddress) {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickPosition = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
