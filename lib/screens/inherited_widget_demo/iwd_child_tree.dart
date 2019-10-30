import 'package:flutter/material.dart';

import 'iwd_bird_color.dart';
import 'iwd_frog_color.dart';

class IWDChildTree extends StatelessWidget {
  showSnackbar(BuildContext context, String content) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          textScaleFactor: 1.4,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () => showSnackbar(
              context,
              FrogColor.of(context).color,
            ),
            child: Text(
              'Frog Color',
              textScaleFactor: 1.4,
            ),
          ),
          RaisedButton(
            onPressed: () => showSnackbar(
              context,
              BirdColor.of(context),
            ),
            child: Text(
              'Bird Color',
              textScaleFactor: 1.4,
            ),
          )
        ],
      ),
    );
  }
}
