import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db/cubits/fetch_favorites_cubit/fetch_favorites_cubit.dart';
import 'package:movies_db/views/screens/favourites_screen/favourites_screen.dart';
import 'package:movies_db/views/screens/movies_details_screen/movies_details_screen.dart';
import 'package:movies_db/views/screens/movies_screen/movies_screen.dart';
import 'package:movies_db/views/shared_components/custom_bottom_nav.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final pageController = PageController();
  @override
  void initState() {
    context.read<FetchFavoritesCubit>().loadFav();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
