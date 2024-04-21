import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';

class Detialpage extends StatefulWidget {
  final int PlantId;
  const Detialpage({super.key, required this.PlantId});

  @override
  State<Detialpage> createState() => _DetialpageState();
}

class _DetialpageState extends State<Detialpage> {
  // toggle favorite button
  bool toggleIsfavorated(bool isfavorited) {
    return !isfavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantlist = Plant.plantlist;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primarycolor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primarycolor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primarycolor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          bool isfavorited = toggleIsfavorated(
                              _plantlist[widget.PlantId].isfavorated);
                          _plantlist[widget.PlantId].isfavorated == isfavorited;
                        });
                      },
                      icon: Icon(
                        _plantlist[widget.PlantId].isfavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primarycolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantlist[widget.PlantId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          plantFeature(
                            title: 'size',
                            PlantFeature: _plantlist[widget.PlantId].size,
                          ),
                          plantFeature(
                            title: 'humidity',
                            PlantFeature:
                                _plantlist[widget.PlantId].humidity.toString(),
                          ),
                          plantFeature(
                              title: 'temperture',
                              PlantFeature:
                                  _plantlist[widget.PlantId].temperture),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primarycolor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantlist[widget.PlantId].plantname,
                            style: TextStyle(
                              color: Constants.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + _plantlist[widget.PlantId].price.toString(),
                            style: TextStyle(
                              color: Constants.blackcolor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantlist[widget.PlantId].rating.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Constants.primarycolor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Constants.primarycolor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      _plantlist[widget.PlantId].description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: Constants.blackcolor.withOpacity(.7),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: const Icon(Icons.shopping_cart, color: Colors.white),
              decoration: BoxDecoration(
                  color: Constants.primarycolor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primarycolor.withOpacity(.3),
                    )
                  ]),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primarycolor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primarycolor.withOpacity(.3),
                      ),
                    ]),
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class plantFeature extends StatelessWidget {
  final String PlantFeature;
  final String title;
  const plantFeature({
    super.key,
    required this.PlantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackcolor,
          ),
        ),
        Text(
          PlantFeature,
          style: TextStyle(
            color: Constants.primarycolor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
