import 'package:flutter/material.dart';

class TaDivider extends StatelessWidget {
  const TaDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Divider(),
    );
  }
}
