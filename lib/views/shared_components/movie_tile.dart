import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_db/cubits/fetch_favorites_cubit/fetch_favorites_cubit.dart';
import 'package:movies_db/cubits/fetch_movies_cubit/fetch_movies_cubit.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/utils/constants/app_colors.dart';
import 'package:movies_db/utils/constants/backend_apis.dart';
import 'package:movies_db/views/screens/movies_details_screen/movies_details_screen.dart';
import 'package:movies_db/views/shared_components/custom_favourite_btn.dart';
import 'package:movies_db/views/screens/movies_screen/reusable_widgets/popularity_widget.dart';
import 'package:movies_db/views/shared_components/custom_cached_image.dart';
import 'package:movies_db/views/shared_components/image_loading_effect.dart';

class MovieTile extends StatelessWidget {
  final Result result;

  const MovieTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MoviesDetailsScreen(
                      movieId: result.id ?? 0,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .appBarTheme
                .backgroundColor,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Hero(
                        tag: "thumbnail_${result.id}",
                        child: CustomCachedImage(
                            imageBaseUrl: BackendApis.thumbnailBaseUrl,
                            movieImagePath: result.posterPath ?? ""),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.sp,
                    right: 5.sp,
                    child: BlocSelector<FetchFavoritesCubit,
                        FetchFavoritesState,
                        List<int>>(
                      selector: (state) {
                        if (state is FetchFavoritesLoaded) {
                          log(state.favIds.toString());
                          return state.favIds;
                        }
                        return [];
                      },
                      builder: (context, state) {
                        log(result.id.toString());
                        return CustomFavouriteBtn(
                          isFav: state.contains(result.id),

                          movieId: result.id??0,
                          movie: result,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            10.verticalSpace,
            Text(
              "${result.title}".toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat(result.releaseDate == null
                        ? "---"
                        : DateFormat.YEAR_ABBR_MONTH_DAY)
                        .format(result.releaseDate!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                ),
                PopularityWidget(
                  averagePopularity: result.voteAverage ?? 0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
