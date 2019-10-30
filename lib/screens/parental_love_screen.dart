import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ParentalLoveScreen extends StatefulWidget {
  @override
  _ParentalLoveScreenState createState() => _ParentalLoveScreenState();
}

class _ParentalLoveScreenState extends State<ParentalLoveScreen> {
  showLove(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Mommy, I love you!',
          textScaleFactor: 1.5,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => showLove(context),
              child: Text(
                'No Builder',
                textScaleFactor: 1.4,
              ),
            ),
            Builder(
              builder: (BuildContext newContext) => RaisedButton(
                onPressed: () => showLove(newContext),
                child: Text(
                  'With Builder',
                  textScaleFactor: 1.4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
