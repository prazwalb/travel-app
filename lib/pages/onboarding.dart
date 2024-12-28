import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'https://m.media-amazon.com/images/I/A1PaCX4oXjL._AC_SL1500_.jpg',
      title: 'Life is short and the world is ',
      highlightedWord: 'wide',
      description:
          'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world',
      buttonText: 'Get Started',
    ),
    OnboardingPage(
      image:
          'https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/66a4263d01a185d5ea22eeec_6408f6e7b5811271dc883aa8_batman-min.png',
      title: "It's a big world out there go ",
      highlightedWord: 'explore',
      description:
          'To get the best of your adventure you just need to leave and go where you like, we are waiting for you',
      buttonText: 'Next',
    ),
    OnboardingPage(
      image:
          'https://cdn.shopify.com/s/files/1/0830/9575/files/dune-part-two-movie-poster-matt-ferguson_ac86f8c9-f410-450c-805b-c4352aac4a55_540x.jpg?v=1730814717',
      title: "People don't take trips, trips take ",
      highlightedWord: 'people',
      description:
          'To get the best of your adventure you just need to leave and go where you like, we are waiting for you',
      buttonText: 'Next',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (_currentPage <= _pages.length) {
      // Navigate to home screen or next screen

      return context.goNamed('signin');
    } else {
      debugPrint('print to home screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(_pages[index]);
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Next Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: _handleNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      _pages[_currentPage].buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Page Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: const SwapEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                page.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: page.title),
                TextSpan(
                  text: page.highlightedWord,
                  style: const TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 100), // Space for bottom buttons
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String image;
  final String title;
  final String highlightedWord;
  final String description;
  final String buttonText;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.highlightedWord,
    required this.description,
    required this.buttonText,
  });
}
