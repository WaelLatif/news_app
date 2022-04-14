// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'components/constanse.dart';
import 'cubit/cubit.dart';
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
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, NewsStates state) {
          var cubit = NewsCubit.get(context);
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
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.grey[800],
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey[800],
                    statusBarIconBrightness: Brightness.light),
                backgroundColor: Colors.grey[800],
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepPurpleAccent,
                unselectedItemColor: Colors.grey,
                elevation: 50.0,
                backgroundColor: Colors.grey[800],
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: cubit.isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
