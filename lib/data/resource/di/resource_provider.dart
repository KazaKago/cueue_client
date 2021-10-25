import 'package:cueue/data/resource/hierarchy/developer_info_constants.dart';
import 'package:cueue/data/resource/hierarchy/store_info_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final developerInfoConstantsProvider = Provider((_) => DeveloperInfoConstants());
final storeInfoConstantsProvider = Provider((_) => StoreInfoConstants());
