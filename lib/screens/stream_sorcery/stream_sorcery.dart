import 'dart:async';

enum StreamStates { wait, dash, sad }

class StreamSorcery {
  StreamController _controller = StreamController.broadcast();
  Stream get listenStream => _controller.stream;

  wait() {
    _controller.sink.add(StreamStates.wait);
  }

  dash() {
    _controller.sink.add(StreamStates.dash);
  }

  sad() {
    _controller.sink.add(StreamStates.sad);
  }

  dispose() {
    _controller.close();
  }

  download() async {
    wait();
    var result = await Future.delayed(Duration(seconds: 2), () {
      return List.generate(10, (i) {
        return '$i is a number';
      });
    });
    dash();
    await Future.delayed(Duration(seconds: 1), () {});
    _controller.sink.add(result);
  }
}
