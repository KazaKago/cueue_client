import 'package:cueue/api/hierarchy/tag/delete_tag_api.dart';

class FakeDeleteTagApi implements DeleteTagApi {
  const FakeDeleteTagApi();

  @override
  Future<void> call(int tagId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
