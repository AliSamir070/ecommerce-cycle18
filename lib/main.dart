import 'package:ecommerce_app/core/remote/local/prefs_manager.dart';
import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response/auth_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/DI/di.dart';
import 'core/routes_manager/route_generator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsManager.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: PrefsManager.getToken().isEmpty
            ?Routes.signInRoute
            :Routes.mainRoute,
      ),
    );
  }
}
