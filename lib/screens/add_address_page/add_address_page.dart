import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/getuserData.dart';
import 'package:food_delivery_application/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/customInputField.dart';

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
  late LatLng _initialPosition = LatLng(30.3753, 69.3451);

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
      backgroundColor: Color(0xffF2F2F2),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: GetBuilder<GetUserData>(builder: (userController) {
          if (userController.snapshot != null &&
              _userPersonNameController.text.isEmpty) {
            _userPersonNameController.text =
                '${userController.snapshot!["name"]}';
            _userPersonNumberController.text =
                '${userController.snapshot!["phone"]}';
            if (Get.find<LocationController>().addressList.isNotEmpty) {
              _userAddressController.text =
                  Get.find<LocationController>().getUserAddress().address;
            }
          }
          return GetBuilder<LocationController>(builder: (value) {
            _userAddressController.text = '${value.placeMark.name ?? ''}'
                '${value.placeMark.locality ?? ''}'
                '${value.placeMark.postalCode ?? ''}'
                '${value.placeMark.country ?? ''}';
            print("Addresss in my view is " + _userAddressController.text);
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        color: Colors.teal.withOpacity(0.2),
                      ),
                    ),
                    child: Stack(children: [
                      GoogleMap(
                          trafficEnabled: true,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: _initialPosition, zoom: 17),
                          zoomControlsEnabled: false,
                          compassEnabled: false,
                          indoorViewEnabled: true,
                          mapToolbarEnabled: false,
                          onCameraIdle: () {
                            value.updatePosition(_cameraPosition, true);
                          },
                          onCameraMove: ((position) =>
                              _cameraPosition = position),
                          onMapCreated: (GoogleMapController controller) {
                            value.setMapController(controller);
                          }),
                    ]),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Text(
                      "Delivery address",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  customInputTextFormField(
                    readOnly: true,
                    controller: _userAddressController,
                    hintText: "Address",
                    iconData: Icons.location_city,
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Text(
                      "Contact name",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  customInputTextFormField(
                    controller: _userPersonNameController,
                    hintText: "User Name",
                    iconData: Icons.person,
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Text(
                      "Your number",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  customInputTextFormField(
                    controller: _userPersonNumberController,
                    hintText: "User Phone",
                    iconData: Icons.phone,
                  ),
                  SizedBox(height: 8.h),
                ]);
          });
        }),
      ),
    );
  }
}