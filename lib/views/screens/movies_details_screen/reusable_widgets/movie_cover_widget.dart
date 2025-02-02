import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/models/movie_details_model.dart';
import 'package:movies_db/utils/constants/backend_apis.dart';
import 'package:movies_db/views/shared_components/custom_cached_image.dart';

class MovieCoverWidget extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;

  const MovieCoverWidget({super.key, required this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.sp,
      width: 1.sw,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 80.sp,
            child: CustomCachedImage(
                imageBaseUrl: BackendApis.coverBaseUrl,
                movieImagePath: movieDetailsModel.backdropPath ?? ""),
          ),
          Positioned(
            left: 0.05.sw,
            bottom: 0,
            top: 90.sp,
            child: Container(
              width: 110.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.4.sp,
                        blurRadius: 1.sp)
                  ]),
              child: Hero(
                tag: "thumbnail_${movieDetailsModel.id}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: CustomCachedImage(
                      movieImagePath: movieDetailsModel.posterPath ?? "",
                      imageBaseUrl: BackendApis.thumbnailBaseUrl),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.05.sw + (120.sp),
            bottom: 0,
            top: 175.sp,
            right: 10.sp,
            child: Text(
              movieDetailsModel.title?.toUpperCase() ?? "N/A",
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp),
            ),
          ),
        ],
      ),
    );
  }
}
