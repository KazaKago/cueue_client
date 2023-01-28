import 'package:cueue/model/auth/firebase_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamFirebaseUserProvider = StreamProvider((ref) {
  return auth.FirebaseAuth.instance.userChanges().map((user) {
    return (user != null) ? FirebaseUser(user) : null;
  });
});

final getFirebaseUserProvider = Provider((ref) {
  final currentUser = auth.FirebaseAuth.instance.currentUser;
  return (currentUser != null) ? FirebaseUser(currentUser) : null;
});
