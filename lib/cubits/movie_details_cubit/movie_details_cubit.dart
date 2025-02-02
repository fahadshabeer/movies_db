import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_db/models/movie_details_model.dart';
import 'package:movies_db/utils/repos/movies_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  getDetails(int movieId)async{
    try{
      emit(MovieDetailsLoading());
      var res=await MoviesRepo.movieDetailsById(id: movieId);
      emit(MovieDetailsLoaded(model: res));
    }catch(e){

    }
  }
}
