import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies_db/models/movies_model.dart';
import 'package:movies_db/utils/api_service/exception_handler.dart';
import 'package:movies_db/utils/repos/movies_repo.dart';

part 'fetch_movies_state.dart';

class FetchMoviesCubit extends Cubit<FetchMoviesState> {
  FetchMoviesCubit() : super(FetchMoviesInitial());

  loadMovies({required int page}) async {
    try {
      emit(FetchMoviesLoading());
      var res = await MoviesRepo.getMovies(page:page);
      emit(FetchMoviesLoaded(moviesModel: res));
    } catch (e) {
      if(e is DioException){
        emit(FetchMoviesError(err: ExceptionHandler.handleError(e)));
      }else{
        emit(FetchMoviesError(err: e.toString()));
      }
    }
  }
}
