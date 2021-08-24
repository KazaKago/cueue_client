import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';

abstract class DeleteTagUseCase {
  Future<void> call(final TagId tagId);
}
