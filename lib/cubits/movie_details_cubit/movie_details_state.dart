part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsModel model;

  MovieDetailsLoaded({required this.model});
}

final class MovieDetailsError extends MovieDetailsState {
  final String err;
  MovieDetailsError({required this.err});
}
