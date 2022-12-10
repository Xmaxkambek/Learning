import "package:flutter/material.dart";
import 'package:learning/models/user.dart';
import 'package:learning/widgets/EnterHomePage.dart';

import 'screens/my_home_page.dart';

void main() {
  runApp(
   const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
