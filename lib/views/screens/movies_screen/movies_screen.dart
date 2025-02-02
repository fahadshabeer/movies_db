import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_db/cubits/fetch_movies_cubit/fetch_movies_cubit.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/views/shared_components/movie_tile.dart';
import 'package:movies_db/views/shared_components/custom_paginated_Gridview.dart';
import 'package:movies_db/views/shared_components/theme_toggle_btn.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final pagingController = PagingController<int, Result>(firstPageKey: 1);
  final originalDataPageController = PagingController<int, Result>(firstPageKey: 1);
  final border=OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.sp),
  );


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
      body: Column(
        children: [
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: TextFormField(
              onChanged: (val){
                if(val.trim().isNotEmpty){
                  final data=pagingController.itemList??[];
                  final searchedData=data.where((e)=>e.title?.toLowerCase().startsWith(val.toLowerCase())??false).toList();
                  pagingController.itemList?.clear();
                  pagingController.appendLastPage(searchedData);
                }else{
                  pagingController.refresh();
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 13.sp),
                border: border,
                hintText: "Search here",
                focusedBorder: border,
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.withValues(alpha: 0.2)
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: BlocListener<FetchMoviesCubit, FetchMoviesState>(
              listener: (context, state) {
                if (state is FetchMoviesLoaded) {
                  final model = state.moviesModel;
                  final totalPages = model.totalPages ?? 0;
                  final currentPage = model.page ?? 0;
                  if (currentPage < totalPages) {
                    pagingController.appendPage(model.results ?? [], currentPage + 1);
                    originalDataPageController.appendPage(model.results ?? [], currentPage + 1);
                  } else {
                    pagingController.appendLastPage(model.results ?? []);
                    originalDataPageController.appendLastPage(model.results ?? []);
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
          ),
        ],
      ),
    );
  }
}
