import 'package:food_delivery_application/data/api/api_client.dart';
import 'package:food_delivery_application/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressFromGeoCode(LatLng latLng) async {
    return await apiClient.get('${AppConstants.GEOCODE_API}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}&key="AIzaSyDAPjmcAZXfqsuO_ftMb0gNbIhDC9pcnYk"');
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESSS) ?? '';
  }
}
