import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    required this.title,
    this.textAlign,
    this.bottomWidget,
    super.key,
  });

  final String title;
  final TextAlign? textAlign;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.black),
      ),
    );
  }
}
