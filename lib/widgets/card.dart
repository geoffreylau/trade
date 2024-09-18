import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/widgets/custom_rounded_rectangle_border.dart';

class XCard extends StatelessWidget {
  const XCard({
    required this.child,
    this.color,
    this.margin,
    this.padding,
    this.shape,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  static Radius get radius => Radius.circular(16.w);

  factory XCard.top({
    required BuildContext context,
    required Widget child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
  }) {
    return XCard(
      child: child,
      color: color,
      margin: margin,
      padding: padding,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: radius)),
    );
  }

  factory XCard.withBorder({
    required BuildContext context,
    required Widget child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
  }) {
    return XCard(
      color: color,
      margin: margin,
      padding: padding,
      onTap: onTap,
      shape: CustomRoundedRectangleBorder(
        side: BorderSide(color: const Color(0xFFDAE3EB), width: 0.5.w),
        borderRadius: BorderRadius.all(radius),
      ),
      child: child,
    );
  }

  factory XCard.withTopBorder({
    required BuildContext context,
    required Widget child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
  }) {
    return XCard(
      child: child,
      color: color,
      margin: margin,
      padding: padding,
      onTap: onTap,
      shape: CustomRoundedRectangleBorder(
        side: BorderSide(color: const Color(0xFFDAE3EB), width: 0.5.w),
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
      ),
    );
  }

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final BorderRadius? borderRadius;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = this.borderRadius ?? BorderRadius.all(radius);
    return Card(
      color: color ?? Colors.white,
      shape: shape ?? RoundedRectangleBorder(borderRadius: borderRadius),
      margin: margin ?? EdgeInsets.zero,
      elevation: 0,
      child: InkWell(
        borderRadius: borderRadius,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
