import 'package:bloc/bloc.dart';
import 'package:movies_db/utils/shared_prefs/shared_prefs.dart';



class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false){
    loadTheme();
  }
  switchTheme(){
    SharedPrefs.setLightMode(!state);
    loadTheme();
  }
  void loadTheme() {
    emit(SharedPrefs.isLightMode());
  }

}
