import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>((event, emit) {
      if(event is CounterIncrement){
        emit(CounterState.current(state.counter + event.increment));
      }else if(event is CounterDecrement){
        emit(CounterState.current(state.counter - event.decrement));
      }
    });
  }
}
