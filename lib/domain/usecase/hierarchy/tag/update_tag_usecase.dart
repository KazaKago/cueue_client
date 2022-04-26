import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';

abstract class UpdateTagUseCase {
  Future<void> call(TagId tagId, TagRegistration tagRegistration);
}
