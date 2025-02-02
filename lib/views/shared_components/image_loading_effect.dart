import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageLoadingEffect extends StatelessWidget {
  const ImageLoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      ignoreContainers: false,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.withValues(alpha: 0.5),
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: BoxDecoration(color: Colors.grey),
        ),
      ),
    );
  }
}
