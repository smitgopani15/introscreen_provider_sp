import 'package:flutter/material.dart';
import 'package:introscreen_provider_sp/screen/intro/provider/intro_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/sp.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroProvider? introProviderTrue;
  IntroProvider? introProviderFalse;
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    introProviderTrue = Provider.of<IntroProvider>(context, listen: true);
    introProviderFalse = Provider.of<IntroProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            introProviderTrue!.lastPage(value);
          },
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${introProviderFalse!.imageList[0]}"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Search How-To's, Help Videos, and",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Solutions to quickly troubleshoot and",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "enhance performance.",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${introProviderFalse!.imageList[1]}"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "View and update warranty status,",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "and local service providers, and check",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "repair status.",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${introProviderFalse!.imageList[2]}"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Check out our deals on Lenovo products",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "in the 'Shop' section.",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: introProviderFalse!.isLastPage
            ? InkWell(
                onTap: () {
                  Sp sp = Sp();
                  sp.saveSp(true);
                  Navigator.pushReplacementNamed(context, 'home_screen');
                },
                child: Container(
                  color: Colors.white,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                height: 60,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.jumpToPage(2);
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                          dotColor: Colors.black12,
                          activeDotColor: Colors.black,
                          dotHeight: 15,
                          dotWidth: 20,
                        ),
                        onDotClicked: (index) {
                          pageController.animateToPage(
                            index,
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pageController.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
