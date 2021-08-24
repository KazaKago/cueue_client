import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

abstract class CreateContentUseCase {
  Future<Content> call(final ContentRegistration contentRegistration);
}
