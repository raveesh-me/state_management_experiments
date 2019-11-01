import 'package:flutter/material.dart';
import 'package:state_management_experiments/screens/change_notifier/counter.dart';
import 'package:state_management_experiments/screens/change_notifier/counter_widget.dart';
import 'package:state_management_experiments/screens/change_notifier/is_even_widget.dart';

class ChangeNotifierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifier Singleton'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // increment the counter
          Counter().increment();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CounterWidget(),
            IsEvenWidget(),
          ],
        ),
      ),
    );
  }
}
