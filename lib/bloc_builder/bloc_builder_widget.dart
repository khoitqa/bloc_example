import 'package:bloc_example/bloc_cubit_model/bloc_model/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderWidget extends StatelessWidget {
  const BlocBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previousState, state) {
          return true;
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("BlocBuilder"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.counter}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
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
                  tooltip: 'Increment',
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 20,),
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrement(1));
                  },
                  tooltip: 'Decrement',
                  color: Colors.red,
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
