//* Como luce el estado del bloc

part of 'counter_bloc.dart';

//? al tener ya instalado Equatable lo utilizo por defecto al crear el bloc desde el New bloc
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 10, this.transactionCount = 0});

  CounterState copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

//? propiedades con las que quiero saber si el objeto cambió o no
  @override
  List<Object> get props => [counter, transactionCount];
}

final class CounterInitial extends CounterState {}
