import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Common/exception_handling/app_init.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'Routes/app_pages.dart';
import 'Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  AppInit.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: Routes.login,
      getPages: AppPages.routes,
    );
  }
}
