import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/repository/hierarchy/info/info_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/info/get_app_info_usecase.dart';

class GetAppInfoUseCaseImpl implements GetAppInfoUseCase {
  const GetAppInfoUseCaseImpl(this._infoRepository);

  final AppInfoRepository _infoRepository;

  @override
  Future<AppInfo> call() {
    return _infoRepository.getAppInfo();
  }
}
