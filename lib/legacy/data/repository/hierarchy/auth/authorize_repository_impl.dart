import 'package:cueue/legacy/data/cache/hierarchy/cache.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthorizeRepositoryImpl implements AuthorizeRepository {
  const AuthorizeRepositoryImpl(this._cacheList);

  final List<Cache> _cacheList;

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
    for (final cache in _cacheList) {
      cache.clearAll();
    }
  }
}
