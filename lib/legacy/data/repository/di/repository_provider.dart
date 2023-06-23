import 'package:cueue/legacy/data/cache/di/cache_provider.dart';
import 'package:cueue/legacy/data/repository/flowable/tag/tag_flowable_factory.dart';
import 'package:cueue/legacy/data/repository/hierarchy/tag/tag_repository_impl.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tagRepositoryProvider = Provider<TagRepository>((ref) => TagRepositoryImpl(ref.read(tagFlowableFactoryProvider)));
final tagFlowableFactoryProvider = Provider<TagFlowableFactory>((ref) => TagFlowableFactory(ref.read(tagCacheProvider), ref.read(tagStateManagerProvider), ref.read(getTagsApiProvider), ref.read(tagResponseMapperProvider)));
