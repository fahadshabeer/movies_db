import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/views/shared_components/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  final String msg;
  final Function() onReload;
  const CustomErrorWidget({super.key,required this.msg,required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        1.sw.horizontalSpace,
        Text(msg,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
          ),),
        20.verticalSpace,
        SizedBox(
          width: 0.5.sw,
          child: CustomButton(
            height: 43.sp,
            text: "Reload",
            textStyle: const TextStyle(
                color: Colors.white
            ),
            onTap: onReload,
            // color: AppColors.darkBlue,
          ),
        )
      ],
    );
  }
}