part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

//? para indicarle a Equatable cuales son los campos que se van a considerar para saber si es el mismo objeto ono
  @override
  List<Object?> get props => [counter, transactionCount];
}
