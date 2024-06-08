import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:inventoryapp/UI/splash_screen.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async{
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Point of Sale Solution',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

