// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'components/constanse.dart';
import 'layout/news_layout.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.deepPurpleAccent,
          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.deepPurpleAccent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurpleAccent,
          elevation: 50.0,
        ),
      ),
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: NewsLayout()),
    );
  }
}
