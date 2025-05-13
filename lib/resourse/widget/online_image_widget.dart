import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carrental/resourse/image/image_handler.dart';
import 'package:carrental/resourse/util/business_dictionary.dart';

class OnlineImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;

  const OnlineImage(this.url, {super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url ?? '',
      fit: BoxFit.cover,
      errorWidget: (context, url, error) =>  Image.asset(
        ImageHandler.IMAGE_PLACE_HOLDER,
      ),
      placeholder: (_, __) => Image.asset(
        ImageHandler.IMAGE_PLACE_HOLDER,
      ),
    );
  }
}