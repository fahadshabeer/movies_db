part of 'add_rmv_favorite_cubit.dart';

@immutable
sealed class AddRmvFavoriteState {}

final class AddRmvFavoriteInitial extends AddRmvFavoriteState {}
final class AddRmvFavoriteLoading extends AddRmvFavoriteState {}
final class AddRmvFavoriteLoaded extends AddRmvFavoriteState {

}
final class AddRmvFavoriteError extends AddRmvFavoriteState {
  final String err;
  AddRmvFavoriteError({required this.err});
}
