import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_application/controllers/location_controller.dart';
import 'package:food_delivery_application/widgets/circuleIndicator.dart';
import 'package:food_delivery_application/widgets/customButton.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(30.3753, 69.3451);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            double.parse(
                Get.find<LocationController>().getAddress['longitude']));

        _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
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
                      target: _initialPosition,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: true,
                    onCameraMove: (CameraPosition cameraPosition) {
                      _cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () {
                      Get.find<LocationController>().updatePosition(
                        _cameraPosition,
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
                    child: CustomButton(
                      buttonText: "Pick Address",
                      width: 200.w,
                      onPressed: locationController.loading
                          ? null
                          : () {
                              if (locationController.pickPosition.latitude !=
                                      0 &&
                                  locationController.pickPlaceMark.name !=
                                      null) {
                                if (widget.fromAddress) {
                                  if (widget.googleMapController != null) {
                                    print("Now you can clicke on this");
                                  }
                                }
                              }
                            },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
