import 'dart:math';

import 'package:flutter/material.dart';

/// 自定义圆角矩形边框，支持只画部分
class CustomRoundedRectangleBorder extends ShapeBorder {
  const CustomRoundedRectangleBorder({
    this.side = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
  });

  final BorderSide side;
  final BorderRadius borderRadius;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) => CustomRoundedRectangleBorder(
        side: side.scale(t),
        borderRadius: borderRadius * t,
      );

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomRoundedRectangleBorder) {
      return CustomRoundedRectangleBorder(
        side: BorderSide.lerp(a.side, side, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t) ?? BorderRadius.zero,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomRoundedRectangleBorder) {
      return CustomRoundedRectangleBorder(
        side: BorderSide.lerp(side, b.side, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t) ?? BorderRadius.zero,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect).deflate(side.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = side.color
      ..strokeWidth = side.width;

    if (borderRadius.topLeft != Radius.zero) {
      canvas.drawArc(
        rectForCorner(rect.topLeft, borderRadius.topLeft, 1, 1),
        pi / 2 * 2,
        pi / 2,
        false,
        paint,
      );
    }
    if (borderRadius.topRight != Radius.zero) {
      canvas.drawArc(
        rectForCorner(rect.topRight, borderRadius.topRight, -1, 1),
        pi / 2 * 3,
        pi / 2,
        false,
        paint,
      );
    }
    if (borderRadius.bottomRight != Radius.zero) {
      canvas.drawArc(
        rectForCorner(rect.bottomRight, borderRadius.bottomRight, -1, -1),
        pi / 2 * 0,
        pi / 2,
        false,
        paint,
      );
    }
    if (borderRadius.bottomLeft != Radius.zero) {
      canvas.drawArc(
        rectForCorner(rect.bottomLeft, borderRadius.bottomLeft, 1, -1),
        pi / 2 * 1,
        pi / 2,
        false,
        paint,
      );
    }
    if (borderRadius.topLeft != Radius.zero || borderRadius.topRight != Radius.zero) {
      canvas.drawLine(
        rect.topLeft +
            Offset(borderRadius.topLeft.x + (borderRadius.topLeft.x == 0 ? side.width : 0.0),
                side.width / 2),
        rect.topRight + Offset(-borderRadius.topRight.x, side.width / 2),
        paint,
      );
    }
    if (borderRadius.bottomRight != Radius.zero || borderRadius.topRight != Radius.zero) {
      canvas.drawLine(
        rect.topRight +
            Offset(-1 * side.width / 2,
                borderRadius.topRight.y + (borderRadius.topRight.x == 0 ? side.width : 0.0)),
        rect.bottomRight + Offset(-1 * side.width / 2, -borderRadius.bottomRight.y),
        paint,
      );
    }

    if (borderRadius.bottomRight != Radius.zero || borderRadius.bottomLeft != Radius.zero) {
      canvas.drawLine(
        rect.bottomRight +
            Offset(
                -borderRadius.bottomRight.x - (borderRadius.bottomRight.x == 0 ? side.width : 0.0),
                -1 * side.width / 2),
        rect.bottomLeft + Offset(borderRadius.bottomLeft.x, -1 * side.width / 2),
        paint,
      );
    }
    if (borderRadius.topLeft != Radius.zero || borderRadius.bottomLeft != Radius.zero) {
      canvas.drawLine(
        rect.bottomLeft +
            Offset(side.width / 2,
                -borderRadius.bottomLeft.y - (borderRadius.bottomLeft.x == 0 ? side.width : 0.0)),
        rect.topLeft + Offset(side.width / 2, borderRadius.topLeft.y),
        paint,
      );
    }
  }

  Rect rectForCorner(Offset offset, Radius radius, double signX, double signY) {
    final d = side.width / 2;
    final borderRadiusX = radius.x - d;
    final borderRadiusY = radius.y - d;
    final rect = Rect.fromPoints(
      offset + Offset(signX.sign * d, signY.sign * d),
      offset +
          Offset(signX.sign * d, signY.sign * d) +
          Offset(signX.sign * 2 * borderRadiusX, signY.sign * 2 * borderRadiusY),
    );
    return rect;
  }
}
