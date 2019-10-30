import 'package:flutter/material.dart';

// the inherited widget that passes it down the tree
class FrogColor extends InheritedWidget {
  final String color;
  final Function(String newColor) changeColor;

  const FrogColor({
    Key key,
    @required this.changeColor,
    @required this.color,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static FrogColor of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FrogColor) as FrogColor;
  }

  // function to decide whether tree will rebuild
  @override
  bool updateShouldNotify(FrogColor old) {
    return old.color != color;
  }
}
