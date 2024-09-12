import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nekomimi/generated/l10n.dart';

class AboutNeko extends StatelessWidget {
  const AboutNeko({super.key});

  void buildAboutTadamonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0.r), // استخدام ScreenUtil لضبط دائرة الزوايا
                clipBehavior: Clip.antiAlias,
                child: const FlutterLogo(size: 45), // ضبط حجم الأيقونة
                // Image.asset(
                //   'lib/assets/images/Tadamon_Logo.png',
                //   width: 45.w, // استخدام ScreenUtil لضبط العرض
                //   height: 45.h, // استخدام ScreenUtil لضبط الارتفاع
                // ),
              ),
              SizedBox(width: 10.w), // استخدام ScreenUtil لضبط المسافة
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).title,
                    style: TextStyle(
                      fontSize: 18.sp, // استخدام ScreenUtil لضبط حجم الخط
                    ),
                  ),
                ],
              ),
            ],
          ),
          content: Container(
            padding: EdgeInsets.all(8.0.w), // استخدام ScreenUtil لضبط padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0.r), // استخدام ScreenUtil لضبط دائرة الزوايا
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Text(
              S.of(context).AboutApp,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.sp, // استخدام ScreenUtil لضبط حجم الخط
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).Close),
            ),
            TextButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              child: Text(
                S.of(context).License,
                style: TextStyle(
                  fontSize: 16.sp, // استخدام ScreenUtil لضبط حجم الخط
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.0.w), // استخدام ScreenUtil لضبط padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0.r), // استخدام ScreenUtil لضبط دائرة الزوايا
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
        ),
        child: Icon(
          Icons.info_outline_rounded,
          size: 24.sp, // استخدام ScreenUtil لضبط حجم الأيقونة
        ),
      ),
      title: Text(
        S.of(context).AboutAppListTitle,
        style: TextStyle(
          fontSize: 18.sp, // استخدام ScreenUtil لضبط حجم الخط
        ),
      ),
      subtitle: Text(
        S.of(context).AboutAppListSubTitle,
        style: TextStyle(
          fontSize: 14.sp, // استخدام ScreenUtil لضبط حجم الخط
        ),
      ),
      onTap: () {
        buildAboutTadamonDialog(context);
      },
    );
  }
}
