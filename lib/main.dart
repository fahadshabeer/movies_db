import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/cubits/add_rmv_favorite_cubit/add_rmv_favorite_cubit.dart';
import 'package:movies_db/cubits/fetch_favorites_cubit/fetch_favorites_cubit.dart';
import 'package:movies_db/cubits/fetch_movies_cubit/fetch_movies_cubit.dart';
import 'package:movies_db/cubits/theme_cubit/theme_cubit.dart';
import 'package:movies_db/utils/constants/app_colors.dart';
import 'package:movies_db/utils/shared_prefs/shared_prefs.dart';
import 'package:movies_db/views/screens/root_screen/root_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefs.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchMoviesCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => FetchFavoritesCubit()),
        BlocProvider(create: (context) => AddRmvFavoriteCubit()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isLightMode) {
            return MaterialApp(
              theme: isLightMode ? AppColors.dark : AppColors.light,
              home: RootScreen(),
            );
          },
        ),
      ),
    );
  }
}
