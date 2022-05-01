import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DioCreatorImpl extends DioCreator {
  @override
  Future<String> loadToken() async {
    try {
      return await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }
}
