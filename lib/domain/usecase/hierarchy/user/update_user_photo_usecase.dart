import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

abstract class UpdateUserPhotoUseCase {
  Future<void> call(ContentRegistration? contentRegistration);
}
