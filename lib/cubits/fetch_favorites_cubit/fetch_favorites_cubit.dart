import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'fetch_favorites_state.dart';

class FetchFavoritesCubit extends Cubit<FetchFavoritesState> {
  FetchFavoritesCubit() : super(FetchFavoritesInitial());

  loadFav(){
    try{

    }catch(e){
      if(e is FirebaseException){

      }else{

      }
    }
  }
}
