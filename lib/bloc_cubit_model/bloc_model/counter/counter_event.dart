part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {
  CounterIncrement(this.increment);

  final int increment;
}

class CounterDecrement extends CounterEvent {
  CounterDecrement(this.decrement);

  final int decrement;
}
