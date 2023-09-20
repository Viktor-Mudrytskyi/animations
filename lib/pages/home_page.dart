import 'package:animations_experiments/pages/secondary_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _dragDownAnimation;

  void _toggleDragUpDown() => _dragDownAnimation.isDismissed
      ? _dragDownAnimation.forward()
      : _dragDownAnimation.reverse();

  void _onVerticalDragUpdate(DragUpdateDetails details, double maxHeight) {
    final dragOffset = details.primaryDelta! / maxHeight;
    final unbalancedValue = dragOffset + _dragDownAnimation.value;
    if (unbalancedValue > 1) {
      _dragDownAnimation.value = 1;
    } else if (unbalancedValue < 0) {
      _dragDownAnimation.value = 0;
    } else {
      _dragDownAnimation.value = unbalancedValue;
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity!.abs() < 100) {
      if (_dragDownAnimation.value > 0.5) {
        _dragDownAnimation.forward();
      } else {
        _dragDownAnimation.reverse();
      }
      return;
    }
    _dragDownAnimation.fling(
      velocity: 1 / details.primaryVelocity!,
    );
  }

  @override
  void initState() {
    _dragDownAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..value = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: LayoutBuilder(
        builder: (context, constr) {
          return Stack(
            children: [
              Container(
                color: Colors.blue[900],
              ),
              AnimatedBuilder(
                animation: _dragDownAnimation,
                builder: (context, child) {
                  return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      _onVerticalDragUpdate(details, constr.maxHeight);
                    },
                    onVerticalDragEnd: _onVerticalDragEnd,
                    onTap: _toggleDragUpDown,
                    child: SecondaryPage(
                      constr: constr,
                      animationValue: _dragDownAnimation.value,
                      onCollapsedTap: _toggleDragUpDown,
                      onCollapseIconTap: _toggleDragUpDown,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _dragDownAnimation.dispose();
    super.dispose();
  }
}
