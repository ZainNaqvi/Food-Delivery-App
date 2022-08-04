import 'package:food_delivery_application/controllers/cart_product_controller.dart';
import 'package:food_delivery_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_application/controllers/recommended_product_controller.dart';
import 'package:food_delivery_application/routes.dart';
import 'package:food_delivery_application/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controllers/getuserData.dart';
import 'helper/dependency.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  if (kIsWeb) {
    Firebase.initializeApp(

      ),
    );
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Get.find<CartProductController>().getCartData();
        Get.find<GetUserData>().getUserData();
        return GetBuilder<PopularProductController>(builder: (_) {
          return GetBuilder<RecommendedProductController>(builder: (_) {
            return Builder(builder: (context) {
              return GetMaterialApp(
                themeMode: ThemeMode.system,
                darkTheme: appThemeData[AppTheme.Dark],
                theme: appThemeData[AppTheme.Light],
                debugShowCheckedModeBanner: false,
                title:
                    'Food Delivery Application || Flutter Firebase || Flutter',
                // home: child,
                initialRoute: AppRoutes.getSplash(),
                getPages: AppRoutes.routes,
              );
            }
            );
          });
        });
      },
      // child: SplashScreen(),
    );
  }
}
