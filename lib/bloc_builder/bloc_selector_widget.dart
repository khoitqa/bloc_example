import 'package:bloc_example/bloc_cubit_model/bloc_model/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorWidget extends StatelessWidget {
  const BlocSelectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocSelector<CounterBloc, CounterState, String>(
        selector: (state) {
          return state.counter != 0 ? "Value passed the selection: ${state
              .counter}" : "Value: ${state.counter}";
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("BlocSelector"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrement(1));
                  },
                  // tooltip: 'Increment',
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 20,),
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrement(1));
                  },
                  // tooltip: 'Decrement',
                  icon: const Icon(Icons.remove),
                ),
              ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}
