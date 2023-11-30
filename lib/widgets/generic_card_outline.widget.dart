import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GenericCardOutline extends StatelessWidget {
  const GenericCardOutline({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xFFD3D3D3),
              width: 0.5.sp,
            ),
          ),
          width: double.infinity,
        ),
        ...children
      ],
    );
  }
}
