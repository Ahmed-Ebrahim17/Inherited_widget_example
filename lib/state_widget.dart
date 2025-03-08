import 'package:flutter/material.dart';
import 'package:study_map4/model/core_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({super.key, required this.child});
  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  CoreState state = CoreState();
  void incrementCounter() {
    setState(() {
      final counter = state.counter + 1;
      final newState = state.copy(counter: counter);

      setState(() {
        state = newState;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      state: state,
      widgetState: this,
      child: widget.child,
    );
  }
}

class StateInheritedWidget extends InheritedWidget {
  final CoreState state;
  final _StateWidgetState widgetState;

  const StateInheritedWidget({
    super.key,
    required super.child,
    required this.state,
    required this.widgetState,
  });

  static _StateWidgetState of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
          .widgetState;

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return oldWidget.state != state;
  }
}
