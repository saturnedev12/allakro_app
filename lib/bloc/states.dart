abstract class StateApp {}

class InitialState extends StateApp {}

class PendingState extends StateApp {}

class ReadyState<T> extends StateApp {
  List<T> data;
  ReadyState({required this.data});
}

class ReadyStateOne<T> extends StateApp {
  late T data;
  ReadyStateOne({required this.data});
}
