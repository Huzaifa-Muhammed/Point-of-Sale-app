import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:inventoryapp/UI/splash_screen.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/ui/home_screen.dart';

void main() async{
  await Hive.initFlutter();
  var myBox=Hive.openBox('myDB');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

