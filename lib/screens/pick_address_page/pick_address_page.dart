import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/location_controller.dart';
import '../../routes.dart';
import '../../widgets/circuleIndicator.dart';
import '../../widgets/customButton.dart';

class PickAddressPage extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;
  PickAddressPage(
      {Key? key,
      required this.fromSignup,
      required this.fromAddress,
      this.googleMapController})
      : super(key: key);

  @override
  State<PickAddressPage> createState() => _PickAddressPageState();
}

class _PickAddressPageState extends State<PickAddressPage> {
  LatLng? _initialPosition;
  GoogleMapController? _mapController;
  CameraPosition? _cameraPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(30.3753, 69.3451);
      _cameraPosition = CameraPosition(target: _initialPosition!, zoom: 17);
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            double.parse(
                Get.find<LocationController>().getAddress['longitude']));

        _cameraPosition = CameraPosition(target: _initialPosition!, zoom: 17);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition!,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: true,
                    onCameraMove: (CameraPosition cameraPosition) {
                      _cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () {
                      Get.find<LocationController>().updatePosition(
                        _cameraPosition!,
                        true,
                      );
                    },
                  ),
                  Center(
                    child: locationController.loading
                        ? CircleIndicator()
                        : Container(),
                  ),
                  Positioned(
                    top: 45.h,
                    left: 20.w,
                    right: 20.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.yellow,
                            size: 28.sp,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                locationController.placeMark.name ??
                                    '...loading',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80.h,
                    left: 20.w,
                    right: 20.w,
                    child: locationController.isloading
                        ? Center(
                            child: CircleIndicator(),
                          )
                        : CustomButton(
                            buttonText: locationController.isZone
                                ? widget.fromAddress
                                    ? "Pick Address"
                                    : "Pick Location"
                                : "Services is not available in your area.",
                      width: 200.w,
                            onPressed: locationController.buttonDisabled ||
                                    locationController.loading
                          ? null
                          : () async {
                              // Get.back();
                              print("\n\n\n\n\n\nstart\n\n\n\n");
                              if (locationController.pickPosition.latitude !=
                                      0.0 &&
                                  locationController.pickPlaceMark.name !=
                                      null) {
                                print("\n\n\n\n\n\nstart2\n\n\n\n");
                                if (widget.fromAddress) {
                                  print("\n\n\n\n\n\nstart3\n\n\n\n");
                                  if (widget.googleMapController != null) {
                                    print("\n\n\n\n\n\nstart4\n\n\n\n");
                                    print("Now you can clicks on this");
                                    widget.googleMapController!.moveCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                          target: LatLng(
                                            locationController
                                                .pickPosition.latitude,
                                            locationController
                                                .pickPosition.longitude,
                                          ),
                                        ),
                                      ),
                                    );
                                    locationController.setAddressData();
                                  }
                                  Get.toNamed(AppRoutes.getAddressPage());
                                }
                              else {
                                        print("\n\n\n\n\n\nstart3\n\n\n\n");
                                        if (widget.googleMapController !=
                                            null) {
                                          print("\n\n\n\n\n\nstart4\n\n\n\n");
                                          print("Now you can clicks on this");
                                          widget.googleMapController!
                                              .moveCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                target: LatLng(
                                                  locationController
                                                      .pickPosition.latitude,
                                                  locationController
                                                      .pickPosition.longitude,
                                                ),
                                              ),
                                            ),
                                          );
                                          locationController.setAddressData();
                                        }
                                        Get.toNamed(AppRoutes.getInitialPage());
                                      }
                              }
                            },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
