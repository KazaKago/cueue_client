import 'package:cueue/data/auth/hierarchy/provider_id.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordProviderId implements ProviderId {
  const PasswordProviderId();

  @override
  String get value => EmailAuthProvider.PROVIDER_ID;
}
