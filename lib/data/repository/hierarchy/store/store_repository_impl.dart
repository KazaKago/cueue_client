import 'package:cueue/data/resource/hierarchy/store_info_constants.dart';
import 'package:cueue/domain/repository/hierarchy/store/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  const StoreRepositoryImpl(this._storeInfoConstants);

  final StoreInfoConstants _storeInfoConstants;

  @override
  Future<Uri> getStoreLink() async {
    return _storeInfoConstants.storeLink;
  }
}
