import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies_db/models/movie_details_model.dart';
import 'package:movies_db/utils/api_service/exception_handler.dart';
import 'package:movies_db/utils/repos/movies_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());
  CancelToken? cancelToken;
  getDetails(int movieId)async{
    try{
      cancelToken=CancelToken();
      emit(MovieDetailsLoading());
      var res=await MoviesRepo.movieDetailsById(id: movieId,cancelToken:cancelToken);
      emit(MovieDetailsLoaded(model: res));
    }catch(e){
      if(e is DioException){
        emit(MovieDetailsError(err: ExceptionHandler.handleError(e)));
      }else{
        emit(MovieDetailsError(err: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
