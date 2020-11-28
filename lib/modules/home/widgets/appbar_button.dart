import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const AppBarButton({Key key, @required this.onPressed, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        minWidth: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: FlatButton(
          padding: EdgeInsets.all(4),
          color: Colors.white24,
          child: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
