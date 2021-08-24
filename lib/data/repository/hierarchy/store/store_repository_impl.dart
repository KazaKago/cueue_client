import 'package:cueue/data/resource/hierarchy/store_constants.dart';
import 'package:cueue/domain/repository/hierarchy/store/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  const StoreRepositoryImpl();

  @override
  Future<Uri> getStoreLink() async {
    return StoreConstants.storeLink;
  }
}
