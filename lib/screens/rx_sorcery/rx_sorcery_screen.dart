import 'package:flutter/material.dart';
import 'package:state_management_experiments/screens/rx_sorcery/rx_sorcery.dart';

import 'dash.dart';

class RxSorceryScreen extends StatefulWidget {
  @override
  _RxSorceryScreenState createState() => _RxSorceryScreenState();
}

class _RxSorceryScreenState extends State<RxSorceryScreen> {
  RxSorcery rxSorcery;

  @override
  void initState() {
    super.initState();
    rxSorcery = RxSorcery();
  }

  @override
  void dispose() {
    super.dispose();
    rxSorcery.dispose(); // dispose them right, prevent stream leaks
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rx Sorcery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: rxSorcery.listenStream,
                builder: (context, AsyncSnapshot snapshot) {
                  // return what you do when there is no data
                  if (!snapshot.hasData)
                    return MagnifiedText("Snapshot does not have data");

                  // if data, check its state
                  final data = snapshot.data;
                  switch (data) {
                    case RxStates.wait:
                      return LinearProgressIndicator(
                        backgroundColor: Colors.red,
                      );
                      break;
                    case RxStates.dash:
                      return Dash();
                      break;
                    case RxStates.sad:
                      return MagnifiedText("Builder really sad");
                      break;
                    default:
                      break;
                  }

                  // finally if  data is a List
                  if (data is List)
                    return ListView.builder(
                      itemBuilder: (_, i) => ListTile(
                        title: Text(
                          data[i].toString(),
                          textScaleFactor: 1.4,
                        ),
                      ),
                      itemCount: (data).length,
                    );

                  // if you can not understand anything
                  return Text("Doing something else altogether");
                },
              ),
            ),
            RaisedButton(
              onPressed: () => rxSorcery.wait(),
              child: Text(
                "Wait",
                textScaleFactor: 1.4,
              ),
            ),
            RaisedButton(
              onPressed: () => rxSorcery.dash(),
              child: Text(
                "Dash!",
                textScaleFactor: 1.4,
              ),
            ),
            RaisedButton(
              onPressed: () => rxSorcery.sad(),
              child: Text(
                "Sad",
                textScaleFactor: 1.4,
              ),
            ),
            RaisedButton(
              onPressed: () => rxSorcery.download(),
              child: Text(
                "Download",
                textScaleFactor: 1.4,
              ),
            ),
            Builder(
              builder: (newContext) => RaisedButton(
                onPressed: () async {
                  try {
                    var result = await rxSorcery.listenStream.first;
                    Scaffold.of(newContext).showSnackBar(
                        SnackBar(content: Text(result.toString())));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  "Fetch Latest",
                  textScaleFactor: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MagnifiedText extends StatelessWidget {
  final String text;

  const MagnifiedText(
    this.text, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1.4,
    );
  }
}
