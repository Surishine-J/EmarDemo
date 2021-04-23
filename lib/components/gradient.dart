import 'package:flutter/material.dart';

import 'constants.dart';

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({
    this.child,
    this.colors,
    this.icon,
  });
  final Widget child;
  final List<Colors> colors;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 1,
          colors: g0,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
