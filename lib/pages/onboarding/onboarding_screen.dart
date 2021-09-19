import 'package:flutter/material.dart';
import 'package:htn2021_project/pages/home/home_screen.dart';
import 'package:htn2021_project/pages/onboarding/interpreter_pages/interpreter_pages.dart';
import 'package:htn2021_project/pages/onboarding/page1.dart';
import 'package:htn2021_project/pages/onboarding/refugee_pages/page1.dart';
import 'package:htn2021_project/pages/onboarding/refugee_pages/refugee_pages.dart';
import 'package:htn2021_project/pages/widgets/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController;
  int _currentPage;
  int _selectedType;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _selectedType = null;
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      Page1(
        onChanged: (index) {
          setState(() {
            _selectedType = index;
          });
        },
      ),
      if (_selectedType == 0) ...[
        RefugeePage1(),
        RefugeePage2(),
        //RefugeePage1(),
        InterpreterPage3(),
        InterpreterPage4(),
      ] else if (_selectedType == 1) ...[
        InterpreterPage1(),
        InterpreterPage2(),
        InterpreterPage3(),
        InterpreterPage4(),
        InterpreterPage5(),
        InterpreterPage6(),
      ] else
        Container()
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
                currentPage: _currentPage,
                numPages: _pages.length,
                returnFunction: () => (_currentPage == 0)
                    ? Navigator.pop(context)
                    : _pageController.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut)),
            Divider(
              color: Theme.of(context).backgroundColor,
              height: 0.0,
              thickness: 2.0,
            ),
            Expanded(
              child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: _pages),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Button(
                title: 'Continue',
                onPressed: (_selectedType != null)
                    ? () => (_pageController.page != _pages.length - 1)
                        ? _pageController.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut)
                        : Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(type: _selectedType,)))
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
