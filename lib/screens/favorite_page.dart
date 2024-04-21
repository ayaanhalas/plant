import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class favoritepage extends StatefulWidget {
  final List<Plant> favoriteplants;
  const favoritepage({super.key, required this.favoriteplants});

  @override
  State<favoritepage> createState() => _favoritepageState();
}

class _favoritepageState extends State<favoritepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('favorite page'),
      ),
    );
  }
}
