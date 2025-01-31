import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'core/routes/app_routes.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
      MaterialApp(
        locale: Locale("ar"),
    debugShowCheckedModeBanner: false,
    routes: AppRoutes.routes,
    initialRoute: AppRoutesName.splash,
    darkTheme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
  )
  );
  FlutterNativeSplash.remove();

}
