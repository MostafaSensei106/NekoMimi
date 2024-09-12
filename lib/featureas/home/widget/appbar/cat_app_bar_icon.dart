import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatAppBarIcons extends StatelessWidget {
  const CatAppBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Padding(
        padding: EdgeInsets.all(9.0.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: Theme.of(context)
                .colorScheme
                .surfaceContainerHigh
                .withOpacity(0.3),
          ),
          child: Icon(
            Icons.more_vert_rounded,
            size: 28.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
