import 'package:flutter/material.dart';

Container emptyContainer() {
  return Container();
}

class MyContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final Null Function()? onPress;

  MyContainer({this.color = Colors.white, required this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
