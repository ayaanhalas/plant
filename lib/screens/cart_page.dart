import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class Cartpage extends StatefulWidget {
  final List<Plant> addedTocartplants;
  const Cartpage({super.key, required this.addedTocartplants});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('cart page'),
      ),
    );
  }
}
