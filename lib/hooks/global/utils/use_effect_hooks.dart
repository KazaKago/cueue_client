import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useEffectSWRError<DATA>(SWRTriggerState<void, DATA> state, void Function(Exception) effect) {
  useEffect(
    () {
      final error = state.error;
      if (error == null) return;
      Future.microtask(() => effect(error));
      state.reset();
      return null;
    },
    [state.error],
  );
}

void useEffectSWRData<DATA>(SWRTriggerState<void, DATA> state, void Function(DATA) effect) {
  useEffect(
    () {
      final data = state.data;
      if (data == null) return;
      Future.microtask(() => effect(data));
      state.reset();
      return null;
    },
    [state.data],
  );
}

void useEffectSWRIsMutating<DATA>(SWRTriggerState<void, DATA> state, void Function({required bool isMutating}) effect) {
  useEffect(
    () {
      final isMutating = state.isMutating;
      Future.microtask(() => effect(isMutating: isMutating));
      return null;
    },
    [state.isMutating],
  );
}
