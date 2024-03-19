import 'package:flutter/material.dart';
import 'package:ezitechprocject/login_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;
//import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart' as sqflite_ffi_web;

void main() async {
  sqflite_ffi.databaseFactory = sqflite_ffi.databaseFactoryFfi;
  //sqflite_ffi.databaseFactory = sqflite_ffi_web.databaseFactoryFfiWeb;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
