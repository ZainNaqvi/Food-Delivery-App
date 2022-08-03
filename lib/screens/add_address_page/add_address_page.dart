import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/add_address_user.dart';
import '../../controllers/getuserData.dart';
import '../../controllers/location_controller.dart';
import '../../routes.dart';
import '../../server/firebase_firestore/add_user_address.dart';
import '../../widgets/circuleIndicator.dart';
import '../../widgets/customInputField.dart';
import '../pick_address_page/pick_address_page.dart';

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
            _userAddressController.text = '${value.placeMark.name ?? '.'}'
                '${value.placeMark.locality ?? '.'}'
                '${value.placeMark.postalCode ?? '.'}'
                '${value.placeMark.country ?? '.'}';

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
                          onTap: (latlng) {
                            value.updatePosition(_cameraPosition, false);
                            Get.toNamed(
                              AppRoutes.getPickAddress(),
                              arguments: PickAddressPage(
                                fromSignup: false,
                                fromAddress: true,
                                googleMapController: value.mapController,
                              ),
                            );
                          },
                          // trafficEnabled: true,
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
                    padding: EdgeInsets.only(left: 20.0, top: 8.h, bottom: 8.h),
                    child: Container(
                      height: 50.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.addressTypeList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              value.setAddressTypeIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              margin: EdgeInsets.only(right: 14.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200]!,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Icon(
                                index == 0
                                    ? Icons.home_filled
                                    : index == 1
                                        ? Icons.work
                                        : Icons.location_on,
                                color: value.addressTypeIndex == index
                                    ? Colors.teal
                                    : Theme.of(context).disabledColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                    readOnly: false,
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
      bottomNavigationBar:
          GetBuilder<LocationController>(builder: (locationController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.maxFinite,
              height: 90.h,
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddAddress().isSaving
                      ? CircleIndicator()
                      : GestureDetector(
                          onTap: () async {
                            String res = await AddAddress().addAddress(
                              name: _userPersonNameController.text,
                              addressType: locationController.addressTypeList[
                                  locationController.addressTypeIndex],
                              phone: _userPersonNumberController.text,
                              address: _userAddressController.text,
                              latitude: locationController.position.latitude
                                  .toString(),
                              longitude: locationController.position.longitude
                                  .toString(),
                              id: FirebaseAuth.instance.currentUser!.uid,
                            );
                            if (res == 'success') {
                              Get.offNamed(AppRoutes.getInitialPage());
                            } else {
                              Get.snackbar("Message",
                                  "The address is not saved. Try again! ");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(18.r),
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            width: 180.w,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              "Save address",
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
