import 'package:flutter/material.dart';
import 'package:state_management_experiments/screens/stream_sorcery/stream_sorcery.dart';

class RxSorceryScreen extends StatefulWidget {
  @override
  _RxSorceryScreenState createState() => _RxSorceryScreenState();
}

class _RxSorceryScreenState extends State<RxSorceryScreen> {
  StreamSorcery streamSorcery;

  @override
  void initState() {
    super.initState();
    streamSorcery = StreamSorcery();
  }

  @override
  void dispose() {
    super.dispose();
    streamSorcery.dispose(); // dispose them right, prevent stream leaks
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Sorcery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: StreamBuilder(
                  stream: streamSorcery.listenStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    // return what you do when there is no data
                    if (!snapshot.hasData)
                      return MagnifiedText("Snapshot does not have data");

                    // if data, check its state
                    final data = snapshot.data;
                    switch (data) {
                      case StreamStates.wait:
                        return LinearProgressIndicator(
                          backgroundColor: Colors.red,
                        );
                        break;
                      case StreamStates.bounce:
                        return Center(
                          child: MagnifiedText("Dash Bounces"),
                        );
                        break;
                      case StreamStates.sad:
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
            ),
            RaisedButton(
              onPressed: () => streamSorcery.wait(),
              child: Text(
                "Wait",
                textScaleFactor: 1.4,
              ),
            ),
            RaisedButton(
              onPressed: () => streamSorcery.bounce(),
              child: Text(
                "Bounce",
                textScaleFactor: 1.4,
              ),
            ),
            RaisedButton(
              onPressed: () => streamSorcery.sad(),
              child: Text(
                "Sad",
                textScaleFactor: 1.4,
              ),
            ),
            RaisedButton(
              onPressed: () => streamSorcery.download(),
              child: Text(
                "Download",
                textScaleFactor: 1.4,
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
