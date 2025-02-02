
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_db/models/movies_model.dart';

class FavoriteRepos
{
  static final _ref=FirebaseFirestore.instance.collection("favorite_movies");
  static Future<void> addFav(Result movie)async{
    await _ref.add(movie.toJson());
  }

  static Future<void> delFav(String id)async{
    await _ref.doc(id).delete();
  }
}