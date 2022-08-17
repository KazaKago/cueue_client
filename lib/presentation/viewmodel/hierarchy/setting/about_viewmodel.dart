import 'package:cueue/domain/usecase/hierarchy/info/get_app_info_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/about_state.dart';
import 'package:flutter/foundation.dart';

class AboutViewModel with ChangeNotifier {
  AboutViewModel(this._getAppInfoUseCase) {
    _load();
  }

  final GetAppInfoUseCase _getAppInfoUseCase;
  AboutState _state = const AboutState.loading();

  AboutState get state => _state;

  set state(AboutState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> _load() async {
    final appInfo = await _getAppInfoUseCase();
    state = AboutState.completed(appInfo);
  }
}
