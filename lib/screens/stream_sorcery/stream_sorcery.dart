import 'dart:async';

enum StreamStates { wait, bounce, sad }

class StreamSorcery {
  StreamController _controller = StreamController.broadcast();
  Stream get listenStream => _controller.stream;

  wait() {
    _controller.sink.add(StreamStates.wait);
  }

  bounce() {
    _controller.sink.add(StreamStates.bounce);
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
    bounce();
    await Future.delayed(Duration(seconds: 1), () {});
    _controller.sink.add(result);
  }
}
