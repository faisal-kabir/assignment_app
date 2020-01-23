import 'package:flutter/material.dart';

class Custom_SizeTransition extends PageTransitionsBuilder {
  const Custom_SizeTransition();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      )=>Align(
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        )
      );

}
