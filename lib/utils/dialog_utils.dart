import 'package:flutter/material.dart';

createSimpleDialog(BuildContext context, String title, String message, Function accept) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
                child: new Text("CANCEL"),
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
            new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  accept();
                }
            ),
          ],
        );
      }
  );
}