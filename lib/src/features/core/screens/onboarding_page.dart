// import 'package:first_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_or_signup.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flowChat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    IntroComponent(
      title: "Welcome to flowChat!",
      description: "Discover the flowChat app that makes your life easier",
      imagePath: "assets/img1.png",
    ),
    IntroComponent(
      title: "Explore",
      description: "Explore amazing features on flowChat tailored just for you",
      imagePath: "assets/img2.png",
    ),
    IntroComponent(
      title: "Stay Connected",
      description: "flowChat Keeps you in touch with your friends and family",
      imagePath: "assets/img3.png",
    ),
    IntroComponent(
      title: "Get Started",
      description: "let's delve into the flowChat app together",
      imagePath: "assets/img4.png",
    ),
  ];

  void _skip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(microseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _onFinish();
    }
  }

  void _onFinish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (context) => LoginOrSignup(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) => _pages[index],
          ),
          _currentIndex == _pages.length - 1
              ? SizedBox.shrink()
              : Positioned(
            bottom: 40,
            left: 20,
            child: TextButton(
              onPressed: _skip,
              child: Text(
                "skip",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: TextButton(
              onPressed: _onNext,
              child: Text(
                _currentIndex == _pages.length - 1 ? "Finish" : "Next",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroComponent extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const IntroComponent({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
