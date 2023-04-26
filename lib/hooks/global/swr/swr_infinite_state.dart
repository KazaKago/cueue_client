import 'package:cueue/hooks/global/swr/swr_infinite_mutate.dart';

class SWRInfiniteState<KEY, DATA> {
  SWRInfiniteState({required this.data, required this.error, required this.isValidating, required this.mutate, required this.size, required this.setSize});

  List<DATA?>? data;
  Exception? error;
  bool isValidating;
  SWRInfiniteMutate<KEY, DATA> mutate;
  int size;
  void Function(int size) setSize;
}
