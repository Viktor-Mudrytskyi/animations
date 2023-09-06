import 'package:flutter/material.dart';

class SecondaryPage extends StatelessWidget {
  const SecondaryPage(
      {super.key,
      required this.height,
      required this.onCollapsedTap,
      required this.onCollapseIconTap});
  final double height;
  final void Function() onCollapsedTap;
  final void Function() onCollapseIconTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCollapseIconTap,
      child: Container(
        height: height,
        color: Colors.yellow[300],
      ),
    );
  }
}
