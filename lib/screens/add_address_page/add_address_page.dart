import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/getuserData.dart';
import 'package:food_delivery_application/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _userAddressController = TextEditingController();
  final _userPersonNameController = TextEditingController();
  final _userPersonNumberController = TextEditingController();
  late bool _isLoggedIn;
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(30.3753, 69.3451), zoom: 17);
  late LatLng _initialPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoggedIn = FirebaseAuth.instance.currentUser != null ? true : false;
    if (_isLoggedIn && Get.find<GetUserData>().snapshot == null) {
      Get.find<GetUserData>().getUserData();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
        target: LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            Get.find<LocationController>().getAddress['longitude']),
      );
      _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          Get.find<LocationController>().getAddress['longitude']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(children: [
        Container(
          height: 140.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.r,
              ),
              border: Border.all(
                width: 2,
                color: Colors.blue,
              )),
        ),
      ]),
    );
  }
}
