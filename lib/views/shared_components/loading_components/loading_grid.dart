import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/views/shared_components/loading_components/loading_movie_tile.dart';

class LoadingGrid extends StatelessWidget {
  const LoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
        shrinkWrap: true,
        padding: EdgeInsets.all(10.sp),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            mainAxisSpacing: 10.sp,
            crossAxisSpacing: 10.sp),
        itemBuilder: (context, index) =>LoadingMovieTile());
  }
}
