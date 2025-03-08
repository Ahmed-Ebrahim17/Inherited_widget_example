import 'package:flutter/material.dart';
import 'package:study_map4/state_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    void incrementCounter() {
      final provider = StateInheritedWidget.of(context);
      provider.incrementCounter();
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: incrementCounter,
              child: Text("Increment Counter"),
            ),
            SizedBox(height: 100),
            ElevatedButton(onPressed: () {}, child: Text("Update Counter")),
          ],
        ),
      ),
    );
  }
}
