import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/repositories/location_repo.dart';
import '../models/address_model.dart';
import 'add_address_user.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
//for service zone
  bool _isloading = false;
  bool get isloading => _isloading;
  bool _isZone = false;
  bool get isZone => _isZone;
  bool _buttonDisabled = true;
  bool get buttonDisabled => _buttonDisabled;
  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();
  List<String> _addressList = [];
  List<String> get addressList => _addressList;
  List<String> _allAddressList = [];
  List<String> get allAddressList => _allAddressList;
  List<String> _addressTypeList = ['home', 'office', 'others'];
  List<String> get addressTypeList => _addressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;
  bool _updateAddressData = true;
  bool _changeAddress = true;
  Map<String, dynamic> _getAddress = {};
  Map<String, dynamic> get getAddress => _getAddress;
// getter
  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  Placemark get placeMark => _placemark;
  Placemark get pickPlaceMark => _pickPlacemark;

  //for saving the google map address by the user
  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;
  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  // updating the location
  Future<void> updatePosition(CameraPosition position, bool fromAddress) async {
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
        bool res = await getZone(position.target.latitude.toString(),
            position.target.longitude.toString(), false);
        _buttonDisabled = !res;

        if (_changeAddress) {
          print("chagenaddres ");
          String _address = await getAddressFromGeoCode(
              LatLng(position.target.latitude, position.target.longitude));
          // print(address);
          fromAddress
              ? _placemark = Placemark(name: _address)
              : _pickPlacemark = Placemark(name: _address);
        }
      } catch (e) {
        print(e);
      }
      _loading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  Future<String> getAddressFromGeoCode(LatLng latLng) async {
    String _address = "Unknown location found";

    Response response = await locationRepo.getAddressFromGeoCode(latLng);
    print(response.status.isOk);
    if (response.body['status'] == 'OK') {
      print("Response ok");

      _address = response.body['results'][0]['formatted_address'].toString();
      print("printing the address" + _address);
    }
    update();
    return _address;
  }

  AddressModel getUserAddress() {
    late AddressModel _addressModel;
    _getAddress = jsonDecode(locationRepo.getUserAddress());
    try {
      _addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (e) {
      print(e);
    }
    return _addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<void> getAddressList() async {
    final data = Get.find<AllAddress>().snapshot;
    if (data != null) {
      print("Data is not null im gettin gin ");
      _addressList = [];
      _allAddressList = [];
      print("Dta in the list is $_addressList");
      _addressList.add(data['address']);
      print("Dta in the list is $_addressList");
      _allAddressList.add(data['address']);
      print("Dta in the list is $_addressList");
    } else {
      print("Data in false  $_addressList");
      _addressList = [];
      _allAddressList = [];
      print(_addressList);
    }
    update();
  }

  void setAddressData() {
    _position = _pickPosition;
    _placemark = _pickPlacemark;
    _updateAddressData = false;
    update();
  }

  Future<bool> getZone(String lat, String lng, bool markerLoad) async {
    bool res = false;
    if (markerLoad) {
      _loading = true;
    } else {
      _isloading = true;
    }
    update();
    await Future.delayed(Duration(seconds: 2), () {
      res = true;
      if (markerLoad) {
        _loading = false;
      } else {
        _isloading = false;
      }
      _isZone = true;
    });
    update();
    return res;
  }
}
