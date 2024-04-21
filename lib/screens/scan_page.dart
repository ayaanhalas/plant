import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

class _ScanpageState extends State<Scanpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
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
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.share,
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
          right: 20,
          left: 20,
          child: Container(
            width: size.width * .8,
            height: size.height * .8,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/code-scan.png',
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tap to scan',
                  style: TextStyle(
                    color: Constants.primarycolor.withOpacity(.80),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ))
    ]));
  }
}
