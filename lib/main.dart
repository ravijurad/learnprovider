import 'package:flutter/material.dart';
import 'package:learn_provider/main_home_screen.dart';
import 'package:learn_provider/navbar/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:learn_provider/content_provider.dart';
import 'package:learn_provider/category_provider.dart';

void main() {
  /// For Single Provider

  // runApp(ChangeNotifierProvider(
  //     create: (context) => ContentProvider(), child: const MyApp()));

  /// For Multi Provider

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContentProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: const MainHomeScreen(),
      home: const BottomHomeScreen(),
    );
  }
}
