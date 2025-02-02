import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class PageLoadingWidget extends StatelessWidget {
  const PageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SpinKitCircle(
        color: Colors.red,
        size: 60.sp,
      ),
    );
  }
}