import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState<T> with _$UiState<T> {
  const factory UiState.loading({T? value}) = _Loading;

  const factory UiState.completed({required T value}) = _Completed;

  const factory UiState.error({T? value, required Exception error}) = _Error;

  const UiState._();

  static UiState<T> initialize<T>({T? value}) => UiState.loading(value: value);

  T? getValue() => when(
        loading: (value) => value,
        completed: (value) => value,
        error: (value, _) => value,
      );
}
