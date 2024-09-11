import 'package:flutter/material.dart';

class CatAppBarIcons extends StatelessWidget {
  const CatAppBarIcons({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme
                .of(context)
                .colorScheme
                .surfaceContainerHigh
                .withOpacity(0.2),
          ),
          child: const Icon(
            Icons.more_vert_rounded,
            size: 28,
          //  color: Colors.white,
          ),
        ),
      ),
    );
  }
}