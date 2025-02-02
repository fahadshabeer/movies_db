import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_db/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_db/views/screens/movies_details_screen/reusable_widgets/movie_cover_widget.dart';
import 'package:movies_db/views/shared_components/custom_error_widget.dart';

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
            if (state is MovieDetailsLoading) {
              return MovieCoverWidget();
            }
            if (state is MovieDetailsError) {
              return Center(
                child: CustomErrorWidget(
                    msg: state.err,
                    onReload: () =>
                        context.read<MovieDetailsCubit>().getDetails(
                            widget.movieId)
                ),
              );
            }
            if (state is MovieDetailsLoaded) {
              final model = state.model;
              return SingleChildScrollView(
                child: MovieCoverWidget(
                  movieDetailsModel: model,
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
