import 'package:block_using_block_library/counter_bloc.dart';
import 'package:block_using_block_library/counter_events.dart';
import 'package:block_using_block_library/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _counterBloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC using flutter_bloc and bloc library'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          bloc: _counterBloc,
          builder: (context, state) {
            print('building state');
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _counterBloc.add(IncrementEvent(state.counter));
                      },
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _counterBloc.add(DecrementEvent(state.counter));
                      },
                      child: Text('Decrement'),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
