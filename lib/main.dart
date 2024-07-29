import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Home%20Pages/root_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  int userID = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    userID = await LocalStorage.getUserID();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff171717),
            useMaterial3: true,
          ),
          home: isLoading
              ? const ScreenLoading()
              : userID != 0
                  ? const RootScreen()
                  : const SplashPage(),
        );
      },
    );
  }
}
