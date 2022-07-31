import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

abstract class UpdateAvatarUseCase {
  Future<void> call(ContentRegistration contentRegistration);
}
