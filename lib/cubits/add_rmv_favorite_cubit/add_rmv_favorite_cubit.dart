import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_rmv_favorite_state.dart';

class AddRmvFavoriteCubit extends Cubit<AddRmvFavoriteState> {
  AddRmvFavoriteCubit() : super(AddRmvFavoriteInitial());
}
