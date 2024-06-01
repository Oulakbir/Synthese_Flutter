import 'package:flutter/material.dart';
import 'package:myapp/loading_page.dart';
import 'contact_page.dart';
import 'home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

   @override
   Widget build(BuildContext context) {
      return const MaterialApp(
      home: LoadingPage() ,
    );
  }

}