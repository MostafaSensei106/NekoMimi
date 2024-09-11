import 'package:flutter/material.dart';
import 'package:nekomimi/featureas/home/widget/appbar/cat_app_bar_icon.dart';
import 'package:nekomimi/featureas/home/widget/appbar/custom_app_bar_clipper.dart';
import 'package:nekomimi/generated/l10n.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: AppBar(
       leading: const CatAppBarIcons(),
        //backgroundColor: Colors.blue,
        title:  Text(S.of(context).title,
        style: const TextStyle(
          //color: Colors.white
        ),),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+15);
}
