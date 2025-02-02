import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_db/cubits/fetch_movies_cubit/fetch_movies_cubit.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/views/screens/movies_screen/reusable_widgets/movie_tile.dart';
import 'package:movies_db/views/shared_components/custom_paginated_listview.dart';
import 'package:movies_db/views/shared_components/theme_toggle_btn.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final pagingController = PagingController<int, Result>(firstPageKey: 1);


  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey){
      context.read<FetchMoviesCubit>().loadMovies(page: pageKey);
    });
    pagingController.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          ThemeToggleBtn(),
          10.horizontalSpace,
        ],
      ),
      body: BlocListener<FetchMoviesCubit, FetchMoviesState>(
        listener: (context, state) {
          if (state is FetchMoviesLoaded) {
            final model = state.moviesModel;
            final totalPages = model.totalPages ?? 0;
            final currentPage = model.page ?? 0;
            if (currentPage < totalPages) {
              pagingController.appendPage(model.results ?? [], currentPage + 1);
            } else {
              pagingController.appendLastPage(model.results ?? []);
            }
          }
          if (state is FetchMoviesError) {
            pagingController.error = state.err;
          }
        },
        child: CustomPaginatedGridview<Result>(
            itemBuilder: (context, item, _) => MovieTile(
              key: ValueKey(item.id),
              result: item,
            ),
            pagingController: pagingController),
      ),
    );
  }
}
