part of 'fetch_movies_cubit.dart';

@immutable
sealed class FetchMoviesState {}

final class FetchMoviesInitial extends FetchMoviesState {}

final class FetchMoviesLoading extends FetchMoviesState {}

final class FetchMoviesLoaded extends FetchMoviesState {
  final MoviesModel moviesModel;

  FetchMoviesLoaded({required this.moviesModel});
}

final class FetchMoviesError extends FetchMoviesState {
  final String err;

  FetchMoviesError({required this.err});
}
