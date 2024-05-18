import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onNextPressed() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/AfterLandingPage');
    }
  }




  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }




  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 12.0,
      width: isActive ? 12.0 : 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                _buildPageContent(
                  svgPath: 'assets/svg/5.svg',
                  text: 'Welcome to the first page',
                ),
                _buildPageContent(
                  svgPath: 'assets/svg/118.svg',
                  text: 'Welcome to the second page',
                ),
                _buildPageContent(
                  svgPath: 'assets/svg/312.svg',
                  text: 'Welcome to the third page',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _onNextPressed,
            child: Text(_currentPage < 2 ? 'Next' : 'Lets Continue'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPageContent({required String svgPath, required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(svgPath, height: 300,width: 400),
        const SizedBox(height: 20),
        Text(
          text,
          style: const TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
