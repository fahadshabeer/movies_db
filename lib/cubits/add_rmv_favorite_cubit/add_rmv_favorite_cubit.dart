import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/utils/repos/favorite_repos.dart';

part 'add_rmv_favorite_state.dart';

class AddRmvFavoriteCubit extends Cubit<AddRmvFavoriteState> {
  AddRmvFavoriteCubit() : super(AddRmvFavoriteInitial());
  addFav(Result movie)async{
    try{
      emit(AddRmvFavoriteLoading());
      var res=await FavoriteRepos.addFav(movie);
      emit(AddRmvFavoriteLoaded());
    }catch(e){
      log(e.toString());
      if(e is FirebaseException){

      }else{

      }
    }
  }

  rmvFav(int id)async{
    try{
      emit(AddRmvFavoriteLoading());
      var res=await FavoriteRepos.delFav(id);
      emit(AddRmvFavoriteLoaded());
    }catch(e){
      if(e is FirebaseException){

      }else{

      }
    }
  }
}
