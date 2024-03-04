import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //?Provider para el gestor de estado Cubit, lo uqe este fuera de aca no puede tener acceso a ese estado

    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //? 1° manera de acceder al estado
    //! esto hace que el estado cambie siempre
    //* se tuvo que agregar el equatable para que sepa cuando el estado es el mismo)
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        //? 3° manera de acceder al estado lo mismo que la segunda pero sin tanto código
        title: context.select((CounterCubit value) {
          return Text('Cubit counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: Center(
        //? 2° manera de acceder al estado: con el bloc builder
        child: BlocBuilder<CounterCubit, CounterState>(
          //*para uqe solo se reconstruya si se cumple la condicion
          //! deberia hacerlo directamente bloc (que sepa cuando es estado cambio o  no)
          //?para eso se hizo el equatable en el counter state
          // buildWhen: (previous, current) => current.counter != previous.counter,

          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, 3);
            },
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, 2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context);
            },
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
