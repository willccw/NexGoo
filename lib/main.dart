import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:NexGoo/core/res/color.dart';
import 'package:NexGoo/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:developer';

void main() async {
  log("start_firebase");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  log("completed_firebase");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'NexGoo',
        debugShowCheckedModeBanner: false,
        theme: AppColors.getTheme,
        initialRoute: Routes.home,
        onGenerateRoute: RouterGenerator.generateRoutes,
      );
    });
  }
}
