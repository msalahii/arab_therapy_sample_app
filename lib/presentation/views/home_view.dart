import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../widgets/home_call_to_action_container.dart';
import '../widgets/home_hero_section.dart';
import '../widgets/home_packages_container.dart';

class HomeView extends HookWidget {
  static const routeName = "/homeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const HomeHeroSectionContainer(),
            HomePackagesContainer(scrollController: scrollController),
            const HomeCallToActionContainer()
          ],
        ),
      ),
    );
  }
}
