import 'package:flutter/material.dart';

class TaDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/5349.jpg",
            ),
           fit: BoxFit.cover,
           filterQuality: FilterQuality.high,
          ),
        ),
        child: null
    );
  }
}
