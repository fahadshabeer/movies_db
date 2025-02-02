import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/cubits/fetch_favorites_cubit/fetch_favorites_cubit.dart';
import 'package:movies_db/views/shared_components/custom_error_widget.dart';
import 'package:movies_db/views/shared_components/loading_components/loading_grid.dart';
import 'package:movies_db/views/shared_components/movie_tile.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  @override
  void initState() {
  loadData();
    super.initState();
  }
  loadData(){
    context.read<FetchFavoritesCubit>().loadFav();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      body: BlocBuilder<FetchFavoritesCubit, FetchFavoritesState>(

        builder: (context, state) {
          if(state is FetchFavoritesError){
            return Center(
              child: CustomErrorWidget(msg: state.err, onReload: loadData),
            );
          }
          if(state is  FetchFavoritesLoaded) {
            final favorites=state.favorites;
            return favorites.isEmpty?
                Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Text(
                      "You didn't added any movies to favorite.",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ),
                )
                :GridView.builder(
              itemCount: favorites.length,
              padding: EdgeInsets.all(10.sp),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 0.5,
                mainAxisSpacing: 10.sp,
                crossAxisSpacing: 10.sp
              ),
              itemBuilder: (context, index) => MovieTile(
                  result: favorites[index]
              )
            );
          }else{
            return LoadingGrid();
          }
        },
      ),
    );
  }
}
