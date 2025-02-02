import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/cubits/theme_cubit/theme_cubit.dart';

class ThemeToggleBtn extends StatelessWidget {
  const ThemeToggleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightMode = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().switchTheme();
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(5.sp),
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: Icon(
          isLightMode ? Icons.light_mode : Icons.dark_mode,
          color: isLightMode ? Colors.amber : Colors.white,
        ),
      ),
    );
  }
}
