import 'package:flutter/material.dart';

// the inherited widget that passes it down the tree
class BirdColor extends InheritedWidget {
  final String color;

  const BirdColor({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static String of(BuildContext context) {
    final widget = context.inheritFromWidgetOfExactType(BirdColor) as BirdColor;
    return widget.color;
  }

  // function to decide whether tree will rebuild
  @override
  bool updateShouldNotify(BirdColor old) {
    return old.color != color;
  }
}
