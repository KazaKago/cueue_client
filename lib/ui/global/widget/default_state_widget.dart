import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/ui/global/widget/error_handling_widget.dart';
import 'package:cueue/ui/global/widget/loading_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DefaultStateWidget<DATA> extends HookWidget {
  const DefaultStateWidget({required this.state, required this.child, this.loadingChild, this.errorChild, super.key});

  final SWRState<dynamic, DATA> state;
  final Widget Function(DATA) child;
  final Widget Function()? loadingChild;
  final Widget Function(Exception)? errorChild;

  @override
  Widget build(BuildContext context) {
    final data = state.data;
    final error = state.error;
    if (data != null) {
      return child(data);
    } else if (error != null) {
      return errorChild?.call(error) ?? ErrorHandlingWidget(error);
    } else {
      return loadingChild?.call() ?? const LoadingWidget();
    }
  }
}
