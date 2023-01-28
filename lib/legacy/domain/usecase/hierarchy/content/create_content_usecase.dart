import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_registration.dart';

abstract class CreateContentUseCase {
  Future<Content> call(ContentRegistration contentRegistration);
}
