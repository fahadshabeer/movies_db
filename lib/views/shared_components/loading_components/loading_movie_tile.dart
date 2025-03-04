import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/views/screens/movies_screen/reusable_widgets/popularity_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingMovieTile extends StatelessWidget {
  final Result? result;

  const LoadingMovieTile({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
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
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            10.verticalSpace,
            Text(
              (result?.title ?? "N/A").toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Text(
                    "--/--/----",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                ),
                PopularityWidget(
                  averagePopularity: result?.voteAverage ?? 0.1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
