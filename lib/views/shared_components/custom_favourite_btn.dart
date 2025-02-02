import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/cubits/add_rmv_favorite_cubit/add_rmv_favorite_cubit.dart';
import 'package:movies_db/models/movies_model.dart';

class CustomFavouriteBtn extends StatefulWidget {
  final int movieId;
  final bool isFav;
  final Result movie;
  const CustomFavouriteBtn({super.key,required this.movieId,required this.movie,required this.isFav});

  @override
  State<CustomFavouriteBtn> createState() => _CustomFavouriteBtnState();
}

class _CustomFavouriteBtnState extends State<CustomFavouriteBtn> {
  bool isResetStat = true;

  @override
  void initState() {
    isResetStat = true;
    super.initState();
  }

  toggle() {
    if (isResetStat) {
      isResetStat=false;
      updateState();
      if(!widget.isFav) {
        context.read<AddRmvFavoriteCubit>().addFav(widget.movie);
      }else{
        context.read<AddRmvFavoriteCubit>().rmvFav(widget.movie.id??0);
      }
      Future.delayed(Duration(milliseconds: 300),(){
        isResetStat=true;
        updateState();
      });

    }
  }

  updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: toggle,
      child: Container(
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
            color: widget.isFav?Theme.of(context).colorScheme.primary:Theme.of(context).appBarTheme.backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.1.sp,
                  blurRadius: 1.sp)
            ]),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AnimatedScale(
              duration: Duration(milliseconds: 300),
              scale: isResetStat?1:1.3,
              child: Icon(
                Icons.favorite,
                size: 15.sp,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
