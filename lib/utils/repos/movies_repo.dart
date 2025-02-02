import 'package:movies_db/models/movie_details_model.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/utils/api_service/api_service.dart';
import 'package:movies_db/utils/constants/backend_apis.dart';

class MoviesRepo {
  static Future<MoviesModel> getMovies({int page = 1}) async {
    var res = await ApiManager().getRequest<dynamic>(BackendApis.discoverMovies,
        queryParams: {"page": page, "api_key": BackendApis.apiKey});
    return MoviesModel.fromJson(res);
  }

  static Future<MovieDetailsModel> movieDetailsById({required int id}) async {
    var res = await ApiManager().getRequest<dynamic>(
        "${BackendApis.movieDetails}$id",
        queryParams: {"api_key": BackendApis.apiKey});
    return MovieDetailsModel.fromJson(res);
  }
}
