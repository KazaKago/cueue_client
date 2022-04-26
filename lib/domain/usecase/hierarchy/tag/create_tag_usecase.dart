import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';

abstract class CreateTagUseCase {
  Future<void> call(TagRegistration tagRegistration);
}
