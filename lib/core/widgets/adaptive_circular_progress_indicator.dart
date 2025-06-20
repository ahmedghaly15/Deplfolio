import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveCircularProgressIndicator extends StatelessWidget {
  const AdaptiveCircularProgressIndicator({
    super.key,
    this.color = Colors.white,
    this.strokeWidth = 2,
    this.backgroundColor,
    this.dimension = 16,
  });

  final Color color;
  final Color? backgroundColor;
  final double strokeWidth, dimension;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox.square(
        dimension: dimension.h,
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeCap: StrokeCap.butt,
          strokeWidth: strokeWidth.w,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
