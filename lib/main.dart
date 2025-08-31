

  import 'package:flutter/material.dart';
import 'package:movies_tv/core_%20module/services/services_locator.dart';
import 'package:movies_tv/movies_module/presentation/screens/movies_screen.dart';

void main() {
  //هنادي ع السيرفر لوكيتور ع الانشيال
  ServicesLocator().init() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
       // primarySwatch: Colors.cyan,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MoviesScreen(),
    );
  }
}


