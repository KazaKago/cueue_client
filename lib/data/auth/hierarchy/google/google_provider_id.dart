import 'package:cueue/data/auth/hierarchy/provider_id.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleProviderId implements ProviderId {
  const GoogleProviderId();

  @override
  String get value => GoogleAuthProvider.PROVIDER_ID;
}
