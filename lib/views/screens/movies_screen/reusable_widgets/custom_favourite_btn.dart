import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFavouriteBtn extends StatefulWidget {
  const CustomFavouriteBtn({super.key});

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
            color: Theme.of(context).appBarTheme.backgroundColor,
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
