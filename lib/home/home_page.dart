import 'package:flutter/material.dart';
import 'package:flutter_web_test/app/app_extensions.dart';
import 'package:flutter_web_test/home/widgets/hero.dart';
import 'package:flutter_web_test/home/widgets/tab_view.dart';
import 'package:flutter_web_test/widgets/custom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool insideButtonVisible = false; // Initial visibility of the "inside" key button

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_updateButtonVisibility);
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateButtonVisibility);
    scrollController.dispose();
    super.dispose();
  }

  void _updateButtonVisibility() {
    double scrollThreshold = context.isMobile
        ? 600
        : context.isDesktop
            ? 400
            : 300; // Adjust this value based on your requirement
    double bottomMargin = 120;
    scrollThreshold -= bottomMargin;

    if (scrollController.offset > scrollThreshold && !insideButtonVisible) {
      setState(() {
        insideButtonVisible = true;
      });
    } else if (scrollController.offset <= scrollThreshold && insideButtonVisible) {
      setState(() {
        insideButtonVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavBar(showButton: insideButtonVisible),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            HeroSection(
              buttonVisible: insideButtonVisible,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: context.isDesktop ? 1250 : 1800),
              child: const TabView(),
            )
          ],
        ),
      ),
    );
  }
}
