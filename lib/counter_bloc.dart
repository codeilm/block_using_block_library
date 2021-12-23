import 'package:block_using_block_library/counter_events.dart';
import 'package:block_using_block_library/counter_state.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int initialValue) : super(CounterState(initialValue));
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent)
      yield CounterState(event.counter + 1);
    else
      yield CounterState(event.counter - 1);
  }
}
