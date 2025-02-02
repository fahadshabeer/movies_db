import 'package:flutter/material.dart';
import 'package:movies_db/views/screens/favourites_screen/favourites_screen.dart';
import 'package:movies_db/views/screens/movies_details_screen/movies_details_screen.dart';
import 'package:movies_db/views/screens/movies_screen/movies_screen.dart';
import 'package:movies_db/views/shared_components/custom_bottom_nav.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          MoviesScreen(),
          FavouritesScreen()
        ],
      ),
      bottomNavigationBar: CustomBottomNav(pageController: pageController),
    );
  }
}
