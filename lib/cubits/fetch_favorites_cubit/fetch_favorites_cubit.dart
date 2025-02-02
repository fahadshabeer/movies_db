import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:movies_db/models/favorite_model.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/utils/repos/favorite_repos.dart';

part 'fetch_favorites_state.dart';

class FetchFavoritesCubit extends Cubit<FetchFavoritesState> {
  FetchFavoritesCubit() : super(FetchFavoritesInitial());

  loadFav(){
    try{
      List<Result> favorites=[];
      Set<int> favIds={};
      emit(FetchFavoritesLoading());
      final snapshots=FavoriteRepos.getFav();
      snapshots.listen((snap){
        favorites.clear();
        favIds.clear();
        for(final doc in snap.docs){
          String id=doc.id;
          final data=doc.data();
          final model= Result.fromJson(data);
          favIds.add(model.id??0);
          favorites.add(model);
        }

        emit(FetchFavoritesLoaded(favIds: favIds.toList(),favorites: favorites));
      });
    }catch(e){
      if(e is FirebaseException){
        emit(FetchFavoritesError(err: e.message??""));
      }else{
        emit(FetchFavoritesError(err: e.toString()));
      }
    }
  }
}
