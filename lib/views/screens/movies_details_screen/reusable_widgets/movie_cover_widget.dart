import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_db/models/movie_details_model.dart';
import 'package:movies_db/utils/constants/backend_apis.dart';
import 'package:movies_db/views/shared_components/custom_cached_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieCoverWidget extends StatelessWidget {
  final MovieDetailsModel? movieDetailsModel;

  const MovieCoverWidget({super.key,  this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: movieDetailsModel == null,
      effect: ShimmerEffect(
        baseColor: Colors.grey,  // Background color
        highlightColor: Colors.grey.shade300, // Shimmer highlight
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 240.sp,
            width: 1.sw,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 80.sp,
                  child: CustomCachedImage(
                      imageBaseUrl: BackendApis.coverBaseUrl,
                      movieImagePath: movieDetailsModel?.backdropPath ?? ""),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: CustomCachedImage(
                          movieImagePath: movieDetailsModel?.posterPath ?? "",
                          imageBaseUrl: BackendApis.thumbnailBaseUrl),
                    ),
                  ),
                ),
                Positioned(
                  left: 0.05.sw + (120.sp),
                  bottom: 0,
                  top: 175.sp,
                  right: 10.sp,
                  child: Text(
                    movieDetailsModel?.title?.toUpperCase() ?? "No Title",
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  movieDetailsModel?.status??"N/A",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
                10.horizontalSpace,
                SizedBox(height: 20.sp, child: VerticalDivider(color: Colors.grey,)),
                10.horizontalSpace,
                Text(
                  movieDetailsModel?.releaseDate!=null?DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(movieDetailsModel!.releaseDate!).toUpperCase():"--/--/----",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Text(
              "Overview",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          5.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Text(
              movieDetailsModel?.overview??"loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum loremipsum",
              style: TextStyle(fontSize: 13.sp),
            ),
          )
        ],
      ),
    );
  }
}
