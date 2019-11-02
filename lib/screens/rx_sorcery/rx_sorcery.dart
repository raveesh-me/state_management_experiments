import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum RxStates { wait, dash, sad }

typedef CtxFunction(BuildContext context);
typedef Future<int> ShowDialogForNumberOfSecondsCallback();

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
    _subject.close();
  }

  snackbar() async {
    final temp = await _subject.first;
    print('the last from subject is $temp');
    _subject.add((BuildContext context) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Hi'),
        ),
      );
    });
    await Future.delayed(Duration(milliseconds: 9));
    _subject.add(temp);
  }

  download({@required ShowDialogForNumberOfSecondsCallback showDialogCallback}) async {
    int numberOfSeconds = await showDialogCallback();
    wait();
    var result = await Future.delayed(Duration(seconds: numberOfSeconds), () {
      return List.generate(20, (i) {
        return '$i is a number';
      });
    });
    dash();
    await Future.delayed(Duration(seconds: 1), () {});
    _subject.add(result);
  }
}
