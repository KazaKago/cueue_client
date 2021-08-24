import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';
import 'package:cueue/domain/usecase/hierarchy/info/get_app_info_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/info/get_developer_info_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/about_state.dart';
import 'package:flutter/foundation.dart';

class AboutViewModel with ChangeNotifier {
  AboutViewModel(this._getAppInfoUseCase, this._getDeveloperInfoUseCase) {
    _load();
  }

  final GetAppInfoUseCase _getAppInfoUseCase;
  final GetDeveloperInfoUseCase _getDeveloperInfoUseCase;
  AboutState _state = const AboutState.loading();

  AboutState get state => _state;

  set state(AboutState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> _load() async {
    final result = await Future.wait([_getAppInfoUseCase(), _getDeveloperInfoUseCase()]);
    state = AboutState.completed(result[0] as AppInfo, result[1] as DeveloperInfo);
  }
}
