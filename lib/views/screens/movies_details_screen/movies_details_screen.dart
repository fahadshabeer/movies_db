import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_db/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_db/views/screens/movies_details_screen/reusable_widgets/movie_cover_widget.dart';

class MoviesDetailsScreen extends StatefulWidget {
  final int movieId;

  const MoviesDetailsScreen({super.key, required this.movieId});

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: BlocProvider(
        create: (context) =>
        MovieDetailsCubit()
          ..getDetails(widget.movieId),
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if(state is MovieDetailsLoaded) {
              final model=state.model;
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieCoverWidget(
                  movieDetailsModel: model,
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.status??"N/A",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      10.horizontalSpace,
                      SizedBox(height: 20.sp, child: VerticalDivider(color: Colors.grey,)),
                      10.horizontalSpace,
                      Text(
                        model.releaseDate!=null?DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(model.releaseDate!).toUpperCase():"--/--/----",
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
                   model.overview??"N/A",
                    style: TextStyle(fontSize: 13.sp),
                  ),
                )
              ],
            );
            }else{
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
