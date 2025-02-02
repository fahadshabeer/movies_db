part of 'fetch_favorites_cubit.dart';

@immutable
sealed class FetchFavoritesState {}

final class FetchFavoritesInitial extends FetchFavoritesState {}
final class FetchFavoritesLoading extends FetchFavoritesState {}
final class FetchFavoritesLoaded extends FetchFavoritesState {
  final List<Result> favorites;
  final List<int> favIds;
  FetchFavoritesLoaded({required this.favorites,required this.favIds});
}
final class FetchFavoritesError extends FetchFavoritesState {
  final String err;
  FetchFavoritesError({required this.err});
}
