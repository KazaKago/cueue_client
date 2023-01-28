import 'package:cueue/model/auth/provider_id.dart';

class AppleProviderId implements ProviderId {
  const AppleProviderId();

  @override
  String get value => 'apple.com';
}
