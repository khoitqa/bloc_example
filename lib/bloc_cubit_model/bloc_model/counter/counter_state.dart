part of 'counter_bloc.dart';

class CounterState {
  final int counter;

  CounterState(this.counter);

  factory CounterState.initial() {
    return CounterState(0);
  }

  factory CounterState.current(int value) {
    return CounterState(value);
  }
}
