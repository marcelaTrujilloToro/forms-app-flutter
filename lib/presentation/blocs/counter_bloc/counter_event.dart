//* Para emitir nuevos estados se hace basado en eventos
//* que tipos de eventos va a recibir el Bloc

part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {}
