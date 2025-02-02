import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularityWidget extends StatelessWidget {
  final double averagePopularity;
  const PopularityWidget({super.key,required this.averagePopularity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.sp,
      width: 30.sp,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              strokeWidth: 2.sp,
              backgroundColor: Colors.black,
              value: averagePopularity/10,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(5.sp),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                    "${(averagePopularity*10).toStringAsFixed(1)}%"
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
