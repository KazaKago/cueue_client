import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_registration.dart';

abstract class ContentRepository {
  Future<Content> create(ContentRegistration contentRegistration);
}
