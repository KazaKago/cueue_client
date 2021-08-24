import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

abstract class ContentRepository {
  Future<Content> create(final ContentRegistration contentRegistration);
}
