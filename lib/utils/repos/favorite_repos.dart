import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/utils/constants/const_data.dart';

class FavoriteRepos {
  static final _ref = FirebaseFirestore.instance.collection("favorite_movies");

  static Future<void> addFav(Result movie) async {
    await _ref.doc("${movie.id}").set(movie.toJson());
  }

  static Future<void> delFav(int id) async {
    await _ref.doc("$id").delete();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getFav()  {
    return _ref.snapshots();
  }
}
