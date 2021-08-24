import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';
import 'package:cueue/domain/repository/hierarchy/info/info_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/info/get_developer_info_usecase.dart';

class GetDeveloperInfoUseCaseImpl implements GetDeveloperInfoUseCase {
  const GetDeveloperInfoUseCaseImpl(this._infoRepository);

  final InfoRepository _infoRepository;

  @override
  Future<DeveloperInfo> call() {
    return _infoRepository.getDeveloperInfo();
  }
}
