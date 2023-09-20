import 'package:flutter/material.dart';

class SecondaryPage extends StatelessWidget {
  const SecondaryPage({
    super.key,
    required this.onCollapsedTap,
    required this.onCollapseIconTap,
    required this.animationValue,
    required this.constr,
  });

  final double animationValue;
  final BoxConstraints constr;
  final void Function() onCollapsedTap;
  final void Function() onCollapseIconTap;

  @override
  Widget build(BuildContext context) {
    final sysPadding = MediaQuery.paddingOf(context);

    final maxHeight = constr.maxHeight - sysPadding.bottom - 70;

    final verticalOffset = maxHeight * animationValue;

    const squareSide = 50.0;

    const minScale = 1.0;
    const maxScale = 4.0;
    final scaleValue = (1 - animationValue) * (maxScale - minScale) + minScale;

    const leftMinValue = 10.0;
    final leftMaxValue = (constr.maxWidth - 50.0 * maxScale) / 2;
    final leftValue =
        (1 - animationValue) * (leftMaxValue - leftMinValue) + leftMinValue;

    const topMinValue = 10.0;
    const topMaxValue = 100.0;
    final topValue =
        (1 - animationValue) * (topMaxValue - topMinValue) + topMinValue;

    return Transform(
      transform: Matrix4.identity()
        ..translate(
          .0,
          verticalOffset,
        ),
      child: Container(
        // height: constr.maxHeight - verticalOffset,
        width: double.maxFinite,
        color: Colors.yellow[300],
        child: Stack(
          children: [
            Positioned(
              top: topValue,
              left: leftValue,
              child: Transform(
                transform: Matrix4.identity()..scale(scaleValue),
                child: Container(
                  height: squareSide,
                  width: squareSide,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
