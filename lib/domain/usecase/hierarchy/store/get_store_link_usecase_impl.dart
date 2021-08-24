import 'package:cueue/domain/repository/hierarchy/store/store_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/store/get_store_link_usecase.dart';

class GetStoreLinkUseCaseImpl implements GetStoreLinkUseCase {
  const GetStoreLinkUseCaseImpl(this._storeRepository);

  final StoreRepository _storeRepository;

  @override
  Future<Uri> call() {
    return _storeRepository.getStoreLink();
  }
}
