import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.circle = false,
    this.borderRadius = 8,
    this.boxFit = BoxFit.cover,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final String? imageUrl;
  final bool? circle;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height?.h,
      width: width?.w,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: (circle!)
              ? null
              : BorderRadius.circular(borderRadius!.r),
          image: DecorationImage(image: imageProvider, fit: boxFit),
        ),
      ),
      imageUrl:
          imageUrl ??
          "https://images.unsplash.com/photo-1610832958506-aa56368176cf?q=80&w=1000&auto=format&fit=crop",
      placeholder: (context, url) => Skeletonizer(
        enabled: true,
        child: Container(
          height: height?.h,
          width: width?.w,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: (circle!)
                ? null
                : BorderRadius.circular(borderRadius!.r),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius: (circle!)
              ? null
              : BorderRadius.circular(borderRadius!.r),
          shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: (circle!)
              ? BorderRadius.circular(360.r)
              : BorderRadius.circular(borderRadius!.r),
          child: Image.network(
            height: height?.h,
            width: width?.w,
            fit: boxFit,
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
        ),
      ),
      fit: boxFit,
    );
  }
}
