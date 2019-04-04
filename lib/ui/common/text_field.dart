import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String hint;
  final Widget child;
  final FormElementOrientation orientation;
  static EdgeInsets contentPadding;

  TextField(
      {this.hint,
        this.child,
        EdgeInsets contentPadding,
        this.orientation = FormElementOrientation.vertical}) {
    if (contentPadding == null) {
      switch (orientation) {
        case FormElementOrientation.horizontal:
          contentPadding = EdgeInsets.only(left: 8.0);
          break;
        default:
          contentPadding = EdgeInsets.only(top: 8.0);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    contentPadding = EdgeInsets.only(top: 0.0, left: 0.0);
    if (hint != null) {
      if (orientation == FormElementOrientation.horizontal) {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(hint, style: textStyle),
              Padding(
                padding: contentPadding,
                child: child,
              )
            ]);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(hint, style: textStyle),
          Padding(
            padding: contentPadding,
            child: child,
          )
        ],
      );
    }
    return child;
  }
}

enum FormElementOrientation { horizontal, vertical }
