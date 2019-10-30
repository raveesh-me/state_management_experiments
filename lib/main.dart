import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'State Management Exps',
        ),
      ),
      body: ListView(
        children: <Widget>[
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
          HomeScreenSelectionButton(
            buttonLabel: '00. setState ',
            pushRouteName: '/setState',
          ),
        ],
      ),
    );
  }
}

// responsibility: provides styling for the HomeScreen buttons
class HomeScreenSelectionButton extends StatelessWidget {
  final String pushRouteName;
  final String buttonLabel;

  const HomeScreenSelectionButton({
    Key key,
    @required this.pushRouteName,
    @required this.buttonLabel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () => Navigator.pushNamed(context, pushRouteName),
        child: Text(
          buttonLabel,
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.black87),
        ),
        color: Colors.teal[100],
        padding: EdgeInsets.symmetric(vertical: 25),
      ),
    );
  }
}
