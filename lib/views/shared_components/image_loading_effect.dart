import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_db/utils/constants/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageLoadingEffect extends StatelessWidget {
  const ImageLoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      ignoreContainers: false,
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(color: Colors.black),
      ),
    );
  }
}
