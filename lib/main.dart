import 'package:flutter/material.dart';
import 'package:shoppingapphng/screens/home_page.dart';

void main() {
  runApp( const MyApp());
}
 class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'HNG Simple Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
       debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
 }