import 'package:cueue/hooks/global/swr/swr_mutate.dart';

class SWRState<KEY, DATA> {
  SWRState({required this.data, required this.error, required this.isValidating, required this.mutate});

  DATA? data;
  Exception? error;
  bool isValidating;
  SWRMutate<KEY, DATA> mutate;
}
