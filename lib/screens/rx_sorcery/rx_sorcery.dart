import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum RxStates { wait, bounce, sad }

class RxSorcery {
  BehaviorSubject _subject = BehaviorSubject();
  Stream get listenStream => _subject.stream;

  wait() {
    _subject.sink.add(RxStates.wait);
  }

  bounce() {
    _subject.sink.add(RxStates.bounce);
  }

  sad() {
    _subject.sink.add(RxStates.sad);
  }

  dispose() {
    _subject.close();
  }

  download() async {
    wait();
    var result = await Future.delayed(Duration(seconds: 2), () {
      return List.generate(20, (i) {
        return '$i is a number';
      });
    });
    bounce();
    await Future.delayed(Duration(seconds: 1), () {});
    _subject.sink.add(result);
  }
}
