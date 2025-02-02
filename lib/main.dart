import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/cubits/fetch_movies_cubit/fetch_movies_cubit.dart';
import 'package:movies_db/cubits/theme_cubit/theme_cubit.dart';
import 'package:movies_db/utils/constants/app_colors.dart';
import 'package:movies_db/views/screens/movies_screen/movies_screen.dart';
import 'package:movies_db/views/screens/root_screen/root_screen.dart';

void main() {
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
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkMode) {
            return MaterialApp(
              theme:isDarkMode?AppColors.dark :AppColors.light,
              home: RootScreen(),
            );
          },
        ),
      ),
    );
  }
}


