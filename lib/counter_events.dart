abstract class CounterEvent {
  int counter;
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(int n) {
    counter = n;
  }
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(int n) {
    counter = n;
  }
}
