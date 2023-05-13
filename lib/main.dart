import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/carrito/carrito.dart';
import 'package:restaurants/home.dart';

void main() {
  runApp(
    //const MyApp(),
    ChangeNotifierProvider(
      create: (context) => Carrito(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurante',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
