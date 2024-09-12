import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/featureas/home/widget/appbar/cat_app_bar_icon.dart';
import 'package:nekomimi/featureas/home/widget/appbar/custom_app_bar_clipper.dart';
import 'package:nekomimi/generated/l10n.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomAppBarClipper(),
          child: Image.asset(
            "assets/images/Cover.jpg",
            fit: BoxFit.cover,
            width: 1.sw, // استخدام ScreenUtil لضبط العرض
            height: 200.h, // ضبط الارتفاع بناءً على حجم الشاشة
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            leading: const CatAppBarIcons(),
            backgroundColor: Colors.transparent,
            elevation: 0, // إزالة الظل لجعل الشريط شفاف بالكامل
            title: Text(
              S.of(context).title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp, // ضبط حجم الخط بناءً على حجم الشاشة
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 15.h); // ضبط الارتفاع بناءً على حجم الشاشة
}
