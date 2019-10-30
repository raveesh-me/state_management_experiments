import 'package:flutter/material.dart';

class SetStateExperimentScreen extends StatefulWidget {
  @override
  _SetStateExperimentScreenState createState() =>
      _SetStateExperimentScreenState();
}

class _SetStateExperimentScreenState extends State<SetStateExperimentScreen> {
  int counter;

  @override
  void initState() {
    super.initState();
    counter = 0;
  }

  // waits for 2 seconds and returns 10
  Future<int> fetchAddend() async {
    return await Future.delayed(Duration(seconds: 2), () => 10);
  }

  incrementByAddend() async {
    // wait for the change
    final int addend = await fetchAddend();
    // change the source of truth
    counter += addend;
    // ask the framework to do the building
    setState(() {});
  }

  incrementByOne() => setState(() {
        counter++;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('counter:'),
                  Text(
                    '$counter',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display4,
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: incrementByAddend,
            child: Text(
              'Increment by Addend',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          Divider(
            height: 20,
          ),
          FlatButton(
            onPressed: incrementByOne,
            child: Text(
              'Increment by One',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
