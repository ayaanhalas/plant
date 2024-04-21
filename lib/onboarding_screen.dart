import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/root_page.dart';

class OnboardingScreeen extends StatefulWidget {
  const OnboardingScreeen({super.key});

  @override
  State<OnboardingScreeen> createState() => _OnboardingScreeenState();
}

class _OnboardingScreeenState extends State<OnboardingScreeen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('onboardingscreen'),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Rootpage()))
              },
              // to login screen .we will update later
              child: const Text(
                'skip',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentindex = page;
              });
            },
            controller: _pageController,
            children: [
              CreatePage(
                image: 'assets/plant2.jpg',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
                constants: Constants,
              ),
              CreatePage(
                image: 'assets/plant2.jpg',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
                constants: Constants,
              ),
              CreatePage(
                image: 'assets/plant2.jpg',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
                constants: Constants,
              )
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 30,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentindex < 2) {
                      currentindex++;
                      if (currentindex < 3) {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const Rootpage()));
                    }
                  });
                },
                icon: const Icon(Icons.arrow_forward,
                    size: 24, color: Colors.white),
              ),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primarycolor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primarycolor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
//create the indicator list

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentindex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

// extra widgets

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final constants;
  const CreatePage({
    super.key,
    required this.constants,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset('assets/plant2.jpg'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
