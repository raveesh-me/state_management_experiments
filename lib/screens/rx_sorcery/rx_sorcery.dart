import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum RxStates { wait, dash, sad }

class RxSorcery {
  BehaviorSubject _subject = BehaviorSubject();
  Stream get listenStream => _subject.stream;

  wait() {
    _subject.add(RxStates.wait);
  }

  dash() {
    _subject.add(RxStates.dash);
  }

  sad() {
    _subject.add(RxStates.sad);
  }

  dispose() {
//    _subject.close();
  }

  download() async {
    wait();
    var result = await Future.delayed(Duration(seconds: 2), () {
      return List.generate(20, (i) {
        return '$i is a number';
      });
    });
    dash();
    await Future.delayed(Duration(seconds: 1), () {});
    _subject.add(result);
  }
}
