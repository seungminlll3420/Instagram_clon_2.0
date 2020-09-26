import 'package:flutter/material.dart';
import 'package:instagram_clon_2/home_page.dart';
import 'package:instagram_clon_2/screen/auth_screen.dart';
import 'package:instagram_clon_2/screen/feed_screen.dart';
import 'constants/material_White.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: white),
      home: HomePage(),
    );
  }
}
