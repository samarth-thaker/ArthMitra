import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void getstarted() {
    Navigator.pushNamed(context, "/signupscreen");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          CarouselSlider(
            carouselController: _carouselController,
            items: [1, 2, 3, 4, 5].map((e) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Item $e',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1.0, 
              enableInfiniteScroll: false, 
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),

          
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: 5,
            effect: const WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: getstarted,
            child: const Text("Get started"),
          )
        ],
      ),
    );
  }
}
