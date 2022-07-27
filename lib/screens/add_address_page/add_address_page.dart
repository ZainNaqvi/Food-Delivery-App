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
      CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initialPosition = LatLng(45.51563, -122.677433);

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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          "Add Address",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: GetBuilder<LocationController>(builder: (value) {
        return Column(children: [
          Container(
            height: 140.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.r,
              ),
              border: Border.all(
                width: 2,
                color: Colors.blue,
              ),
            ),
            child: Stack(children: [
              GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialPosition, zoom: 17),
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  indoorViewEnabled: true,
                  mapToolbarEnabled: false,
                  onCameraIdle: () {
                    value.updatePosition(_cameraPosition, true);
                  },
                  onCameraMove: ((position) => _cameraPosition = position),
                  onMapCreated: (GoogleMapController controller) {
                    value.setMapController(controller);
                  }),
            ]),
          ),
        ]);
      }),
    );
  }
}
