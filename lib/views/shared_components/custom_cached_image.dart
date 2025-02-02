import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_db/views/shared_components/image_loading_effect.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageBaseUrl;
  final String movieImagePath;
  const CustomCachedImage({super.key,required this.movieImagePath,required this.imageBaseUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context,url)=>ImageLoadingEffect(),
      imageUrl:"$imageBaseUrl$movieImagePath",
      fit: BoxFit.cover,
      errorWidget: (context,err,obj)=>ImageLoadingEffect(),
    );
  }
}
